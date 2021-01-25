import 'package:flutter/material.dart';
import 'package:myFlutterApp/screens/users_view.dart';

import '../util/change_screen.dart';

class DrawerWidget extends StatelessWidget {

  Widget buildDrawerHeader() => DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/user.jpeg'),
        ),
      ),
      child: Stack(children: <Widget>[
        Positioned(
          bottom: 4.0,
          left: 16.0,
          child: Text(
            'USER MANAGEMENT SYSTEM',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ]));

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          buildDrawerHeader(),
          ListTile(
            title: Text('View Users List'),
            onTap: () => changeScreen(context, UsersView()),
          ),
          ListTile(
            title: Text('Update User Info'),
            onTap: () => loadPreviousScreen(context),
          ),
        ],
      ),
    );
  }
}
