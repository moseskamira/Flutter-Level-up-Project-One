import 'package:flutter/material.dart';
import 'package:myFlutterApp/models/user_model.dart';

class DetailScreen extends StatelessWidget {
  final User detailedUser;

  DetailScreen({Key key, @required this.detailedUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('USER DETAILS'),
      ),
      backgroundColor: Colors.white,
      body: new Container(
        color: Colors.white,
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image(
                image: NetworkImage(detailedUser.profileImage),
              ),
            ),
            Container(
              child: Text(
                detailedUser.userName,
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
                detailedUser.id.toString(),
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
                detailedUser.userType,
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
      ),
    );
  }
}
