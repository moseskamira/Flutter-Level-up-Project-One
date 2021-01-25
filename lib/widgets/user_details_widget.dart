import 'package:flutter/material.dart';
import 'package:myFlutterApp/models/user_model.dart';

class UserDetailsWidget extends StatelessWidget {
  final User user;

  UserDetailsWidget({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Image(
              image: NetworkImage(user.profileImage),
            ),
          ),
          Container(
            child: Text(
              user.userName,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'Aleo',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                  color: Colors.black),
            ),
          ),
          Container(
            child: Text(
              user.id.toString(),
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'Aleo',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                  fontSize: 24.0,
                  color: Colors.black),
            ),
          ),
          Container(
            child: Text(
              user.userType,
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: 'Aleo',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                  fontSize: 24.0,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
