import 'package:flutter/material.dart';
import 'package:myFlutterApp/widgets/drawer.dart';
import 'package:myFlutterApp/widgets/page_title_text.dart';
import '../widgets/user_widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormScreenState();
}

class _FormScreenState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: PageTitleText(
          titleText: 'Kampala Java Devs',
          textColor: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(8),
        child: UserWidget(),
      ),
      drawer: DrawerWidget(),
    );
  }
}
