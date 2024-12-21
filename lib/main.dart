import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mero_anime/Authentication/firebase_auth_state_change.dart';
import 'package:mero_anime/Themes/default_theme.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightMode,
      darkTheme: darkMode,
      home: const FirebaseAuthStateChange(),
    );
  }
}

