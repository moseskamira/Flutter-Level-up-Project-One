import 'package:flutter/material.dart';

class UsersView extends StatelessWidget {
  @override
  Widget build(BuildContext context)=> Scaffold(
      appBar: AppBar(
        title: Text('Users View'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('This Is Users View'),
          ],
        ),
      ),
    );

}