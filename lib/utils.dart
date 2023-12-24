import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

bool isDarkMode(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark;
}

void showFirebaseErrorSnack(BuildContext context, Object? error) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    showCloseIcon: true,
    content: Text(
      (error as FirebaseException).message ?? "Something went wrong.",
    ),
  ));
}
