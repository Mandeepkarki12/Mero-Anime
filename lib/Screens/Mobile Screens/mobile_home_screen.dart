import 'package:flutter/material.dart';
import 'package:mero_anime/Screens/Mobile%20Screens/test_screen.dart';
import 'package:mero_anime/Screens/Web%20Screens/test_screen2.dart';
import 'package:mero_anime/Screens/switch_screen.dart';

class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({super.key});
  @override
  State<MobileHomeScreen> createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: const Text(
            'M E R O A N I M E',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Column(
         
        ));
  }
}
