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
      body: new Container(
        color: Colors.white,
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // Container(
            //   width: 200.0,
            //   decoration: new BoxDecoration(
            //       image: DecorationImage(
            //           image: new AssetImage(detailedUser.profileImage),
            //           fit: BoxFit.fill
            //       ),
            //       shape: BoxShape.circle
            //   ),
            // ),

            Container(
              child:Text(detailedUser.id,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'Aleo',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    fontSize: 24.0,
                    color: Colors.black
                ),
              ),
            ),
            Container(
              child:Text(detailedUser.userName,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'Aleo',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.black
                ),
              ),
            ),
            Container(
              child:Text(detailedUser.userSalary,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'Aleo',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    fontSize: 24.0,
                    color: Colors.black
                ),
              ),
            ),
            Container(
              child:Text(detailedUser.userAge,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontFamily: 'Aleo',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.normal,
                    fontSize: 24.0,
                    color: Colors.black
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
