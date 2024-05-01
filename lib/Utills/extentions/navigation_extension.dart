import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  void navigateTo(Widget page) {
    Navigator.of(this).push(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void navigateAndReplace(Widget page) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void navigateAndRemoveUntil(Widget page) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
          (Route<dynamic> route) => false,
    );
  }

  void navigateBack() {
    Navigator.of(this).pop();
  }
}
