import 'package:flutter/material.dart';

class MakeTestable {
  static Widget returnTestableWidget(Widget child) {
    return MaterialApp(
      home: child,
    );
  }
}
