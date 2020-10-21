import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myFlutterApp/screens/user_details.dart';
import 'dart:convert';

import '../models/user_model.dart';

const url = "https://api.github.com/";

class UsersView extends StatelessWidget {
  String getPath() {
    return url + "search/users?q=type:User+location:Kampala+language:JAVA";
  }

  ListView createUsersListView(usersList) => ListView.builder(
        itemCount: usersList.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(usersList[index].userName,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                )),
            subtitle: Text(usersList[index].profileUrl),
            leading: Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(usersList[index].profileImage),
                    ))),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailScreen(detailedUser: usersList[index]),
              ),
            ),
          ),
        ),
      );

  Future<List<User>> getUsers() async {
    final result = await http.get(getPath());
    if (result.statusCode == 200) {
      var json = jsonDecode(result.body);
      List jsonData = json['items'];
      print(jsonData.toString());
      return jsonData.map((users) => User.fromJson(users)).toList();
    } else {
      throw Exception('Failed To Fetch Data');
    }
  }

  FutureBuilder usersDisplayData() => FutureBuilder<List<User>>(
        future: getUsers(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData) {
            List<User> users = snapshot.data;
            print('THIRD USER IN LIST:' + users.elementAt(2).userName);
            return createUsersListView(users);
          } else if (snapshot.hasError) {
            if (snapshot.error.toString().contains('Failed host lookup')) {
              return Text('Bad or No Connection');
            } else if (snapshot.error
                .toString()
                .contains('Connection refused')) {
              return Text('Insufficient or No Data');
            }
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('USER MANAGEMENT SYSTEM'),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: usersDisplayData(),
        ),
      );
}
