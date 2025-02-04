// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAxS1BGrsVUHyUQK5GCKNvD2FKnvmiqLME',
    appId: '1:610596902875:web:39ed6466ccd894e6c379fe',
    messagingSenderId: '610596902875',
    projectId: 'mero-anime',
    authDomain: 'mero-anime.firebaseapp.com',
    storageBucket: 'mero-anime.firebasestorage.app',
    measurementId: 'G-4MRZV6T9WX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCGX0PsnvH_4eQTq1OEzY4jzmhieqfOKNA',
    appId: '1:610596902875:android:1030fbb6b8ee8629c379fe',
    messagingSenderId: '610596902875',
    projectId: 'mero-anime',
    storageBucket: 'mero-anime.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCME5MvEOJKDuHr_WHLkDENRoSet7KCeG8',
    appId: '1:610596902875:ios:d3a3b8216e9e4f9dc379fe',
    messagingSenderId: '610596902875',
    projectId: 'mero-anime',
    storageBucket: 'mero-anime.firebasestorage.app',
    iosBundleId: 'com.example.meroAnime',
  );
}
