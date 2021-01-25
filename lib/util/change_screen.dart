import 'package:flutter/material.dart';

Future changeScreen(BuildContext context, Widget widget) async {
  Navigator.push(context, MaterialPageRoute(builder: (_) => widget));
}

Future loadPreviousScreen(BuildContext context) async {
  Navigator.pop(context);
}
