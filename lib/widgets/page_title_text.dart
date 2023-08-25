import 'package:flutter/material.dart';

class PageTitleText extends StatelessWidget {
  final String titleText;
  final Color textColor;

  PageTitleText({required this.titleText, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Text(
        titleText,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
