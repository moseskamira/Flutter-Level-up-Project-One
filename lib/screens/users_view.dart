import 'package:flutter/material.dart';
import 'package:myFlutterApp/widgets/user_widget.dart';

class UsersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('U.M.S'),
        brightness: Brightness.light,
      ),
      backgroundColor: Colors.white,
      body: UserWidget(),
    );
  }
}
