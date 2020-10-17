import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myFlutterApp/screens/user_details.dart';
import 'dart:convert';

import '../models/user_model.dart';

const url = "http://dummy.restapiexample.com/";

class UsersView extends StatelessWidget {
  String getPath() {
    return url + "api/v1/employees";
  }

  ListView _createUsersListView(usersList) {
    return ListView.builder(
        itemCount: usersList.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
                title: Text(usersList[index].userName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    )),
                subtitle: Text(usersList[index].userSalary),
                leading: Icon(
                  Icons.work,
                  color: Colors.blue[500],
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(detailedUser: usersList[index]),
                    ),
                  );
                },
              ),


          );
        }
    );
  }

  Future<List<User>> getUsers() async {
    final result = await http.get(getPath());
    if (result.statusCode == 200) {
      var json = jsonDecode(result.body);
      List jsonData = json['data'];
      print(jsonData.toString());
      return jsonData.map((users) => new User.fromJson(users)).toList();

    } else {
      throw Exception('Failed To Fetch Data');
    }
  }

  FutureBuilder _usersDisplayData(){
    return FutureBuilder<List<User>>(
      future: getUsers(),
      builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot){
        if (snapshot.hasData) {
          List<User> users = snapshot.data;
          return _createUsersListView(users);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }


  @override
  Widget build(BuildContext context)=> Scaffold(
      appBar: AppBar(
        title: Text('USER MANAGEMENT SYSTEM'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: _usersDisplayData(),
      ),
    );

}