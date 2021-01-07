
import 'package:flutter/material.dart';

Future changeScreen(BuildContext context, Widget widget) async{
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => widget));
}