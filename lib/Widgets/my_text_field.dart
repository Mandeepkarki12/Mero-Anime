import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final FocusNode? focusNode ;

  const MyTextfield({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
  
    this.focusNode
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const  EdgeInsets.symmetric(horizontal: 22),
      child: ConstrainedBox(
        constraints:const BoxConstraints(
          maxWidth: 400,
        ),
        child: TextField(     
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              fillColor: Theme.of(context).colorScheme.primary,
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(color: Theme.of(context).colorScheme.tertiary)),
        ),
      ),
    );
  }
}
