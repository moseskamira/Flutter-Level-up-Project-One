import 'package:flutter/material.dart';
import 'package:myFlutterApp/widgets/page_title_text.dart';
import 'package:myFlutterApp/widgets/user_widget.dart';

class UsersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: PageTitleText(
          titleText: 'U.M.S',
          textColor: Colors.white,
        ),
        brightness: Brightness.light,
      ),
      backgroundColor: Colors.white,
      body: UserWidget(),
    );
  }
}
