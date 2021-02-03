import 'package:flutter/material.dart';

Future changeScreen(BuildContext context, Widget widget) async {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => widget));
}

Future loadPreviousScreen(BuildContext context) async {
  Navigator.of(context).pop();
}
