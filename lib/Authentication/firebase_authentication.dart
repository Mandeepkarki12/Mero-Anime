import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String registerExceptionMessage = '';
  String loginExceptionMessage = '';
  String resetPasswordExceptionMessage='';
  Future<bool> accountRegister(String email, String password) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      registerExceptionMessage = "Register Sucessfull";
      return true;
    } on SocketException {
      registerExceptionMessage =
          'No internet connection. Please check your network.';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        registerExceptionMessage = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        registerExceptionMessage = 'The account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        registerExceptionMessage = 'The email provided is invalid.';
      } else {
        registerExceptionMessage = e.message.toString();
      }
    } catch (e) {
      registerExceptionMessage = e.toString();
    }
    return false;
  }

  Future<bool> accountLogin(String email, String password) async {
    try {
      // Attempt to sign in with email and password
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      loginExceptionMessage = 'User logged in: ${userCredential.user?.email}';
      return true; // Login successful
    } on SocketException {
      // Handle no internet connection
      loginExceptionMessage =
          'No internet connection. Please check your network.';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        loginExceptionMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        loginExceptionMessage = 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-email') {
        loginExceptionMessage = 'The email provided is invalid.';
      } else {
        loginExceptionMessage = e.message.toString();
      }
    } catch (e) {
    
      loginExceptionMessage = e.toString();
    }
    return false; 
  }

  Future<void> accountLogout() async {
    await _firebaseAuth.signOut();
  }

  Future<bool> forgotPassword(String email) async {
  try {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
    print('Password reset email sent successfully to $email.');
    resetPasswordExceptionMessage = 'Password reset email sent successfully to $email.';
    return true ;
  } catch (e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'invalid-email':
          print('The email address is not valid.');
          resetPasswordExceptionMessage='The email address is not valid.';
          return false ;
          break;
        case 'user-not-found':
          print('No user found with this email address.');
          resetPasswordExceptionMessage ='No user found with this email address.';
           return false ;
          break;
        default:
          print('An error occurred: ${e.message}');
          resetPasswordExceptionMessage ='An error occurred: ${e.message}';
           return false ;
      }
    } else {
      print('An unexpected error occurred.');
      resetPasswordExceptionMessage ='An error occurred';
       return false ;
    }
  }
}

}
