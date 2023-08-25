import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message, {bool error = false}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      message,
      style: const TextStyle(
        fontWeight: FontWeight.normal,
        color: Colors.white,
        fontSize: 14,
      ),
      textAlign: TextAlign.center,
    ),
    backgroundColor: error ? Colors.red : Colors.blue,
    duration: const Duration(seconds: 5),
  ));
}
