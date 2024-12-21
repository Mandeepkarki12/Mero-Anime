import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mero_anime/Screens/Mobile%20Screens/mobile_home_screen.dart';
import 'package:mero_anime/Screens/Mobile%20Screens/mobile_login_page.dart';
import 'package:mero_anime/Screens/Web%20Screens/web_home_page.dart';
import 'package:mero_anime/Screens/Web%20Screens/web_login_screen.dart';
import 'package:mero_anime/Screens/switch_screen.dart';

class FirebaseAuthStateChange extends StatelessWidget {
  const FirebaseAuthStateChange({super.key});
 @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Display loading indicator while checking auth state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // Check if the user is logged in
        if (snapshot.hasData) {
          // Show Home screen for authenticated users
          return const SwitchScreen(
            mobileBody: MobileHomeScreen(),
            desktopBody: WebHomePage(),
          );
        } else {
          // Show Login screen for unauthenticated users
          return  SwitchScreen(
            mobileBody: MobileLoginPage(),
            desktopBody: WebLoginScreen(),
          );
        }
      },
    );
  }
}