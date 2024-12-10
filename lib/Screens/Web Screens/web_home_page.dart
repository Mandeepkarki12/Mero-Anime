import 'package:flutter/material.dart';
class WebHomePage extends StatefulWidget {
  const WebHomePage({super.key});
  @override
  State<WebHomePage> createState() => _WebHomePageState();
}
class _WebHomePageState extends State<WebHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'M E R O ',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,       
      ),
    );
  }
}
