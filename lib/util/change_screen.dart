import 'package:flutter/material.dart';

class ChangeScreen {
  static Future changeScreen(BuildContext context, Widget widget) async {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => widget));
    // Navigator.push(context, MaterialPageRoute(builder: (_) => widget));
  }

  static Future loadPreviousScreen(BuildContext context) async {
    Navigator.of(context).pop();
  }
}
