import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mero_anime/Providers/error_message_provider.dart';

class ErrorMessage extends StatelessWidget {
  final Color textColor;
  final Color backgroundColor;
  final double fixedWidth;

  const ErrorMessage({
    super.key,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.redAccent,
    this.fixedWidth = 500, // Set a default fixed width
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ErrorMessageProvider>(
      builder: (context, errorMessageProvider, child) {
        return AnimatedOpacity(
          opacity: errorMessageProvider.showErrorMessage ? 1.0 : 0.0,
          duration: const Duration(seconds: 1),
          child: Material(
            color: backgroundColor,
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: fixedWidth, // Apply fixed width here
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                child: Text(
                  errorMessageProvider.errorMessage,
                  style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

void showErrorMessage(BuildContext context, String message) {
  final errorMessageProvider =
      Provider.of<ErrorMessageProvider>(context, listen: false);
  errorMessageProvider.setErrorMessage(message);
}
