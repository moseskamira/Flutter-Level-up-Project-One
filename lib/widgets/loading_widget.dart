import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FadingText(
        'Loading Please Wait...',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
