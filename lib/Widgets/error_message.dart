import 'package:flutter/material.dart';
class ErrorMessage extends StatelessWidget {
  final String message;
  final Color textColor;
  final Color backgroundColor;

  const ErrorMessage({
    super.key,
    required this.message,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.redAccent,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Material(
        color: backgroundColor,
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          child: Text(
            message,
            style: TextStyle(
                color: textColor, fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}