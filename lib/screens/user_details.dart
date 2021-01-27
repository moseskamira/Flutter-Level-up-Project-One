import 'package:flutter/material.dart';
import 'package:myFlutterApp/models/user_model.dart';
import 'package:myFlutterApp/widgets/user_details_widget.dart';

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
      body: UserDetailsWidget(user: detailedUser),
    );
  }
}
