import 'package:flutter/material.dart';

class ErrorMessageProvider with ChangeNotifier {
  bool _showErrorMessage = false;
  String _errorMessage = '';

  bool get showErrorMessage => _showErrorMessage;
  String get errorMessage => _errorMessage;

  void setErrorMessage(String message) {
    _errorMessage = message;
    _showErrorMessage = true;
    notifyListeners();
    Future.delayed(const Duration(seconds: 3), () {
      _showErrorMessage = false;
      notifyListeners();
    });
  }
}