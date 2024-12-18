import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mero_anime/Screens/Mobile%20Screens/mobile_forgot_password_page.dart';
import 'package:mero_anime/Screens/Mobile%20Screens/mobile_home_screen.dart';
import 'package:mero_anime/Screens/Mobile%20Screens/mobile_login_page.dart';
import 'package:mero_anime/Screens/Mobile%20Screens/mobile_register_page.dart';
import 'package:mero_anime/Screens/Web%20Screens/web_forgot_password_page.dart';
import 'package:mero_anime/Screens/Web%20Screens/web_home_page.dart';
import 'package:mero_anime/Screens/Web%20Screens/web_login_screen.dart';
import 'package:mero_anime/Screens/Web%20Screens/web_register_screen.dart';
import 'package:mero_anime/Screens/switch_screen.dart';
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
        home:  SwitchScreen(
            mobileBody: MobileLoginPage(), desktopBody: WebLoginScreen()  ));
  }
}
