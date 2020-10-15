import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user_model.dart';

const url = "http://dummy.restapiexample.com/";

class UsersView extends StatelessWidget {

  String getPath() {
    return url + "api/v1/employees";
  }

  ListView _createUsersListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
                title: Text(data[index].userName,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    )),
                subtitle: Text(data[index].userSalary),
                leading: Icon(
                  Icons.work,
                  color: Colors.blue[500],
                ),
              ),
          );
        }
    );
  }

  Future<List<User>> getUsers() async {
    final result = await http.get(getPath());
    if (result.statusCode == 200) {
      var json = jsonDecode(result.body);
      List myData = json['data'];
      print(myData.toString());
      return myData.map((users) => new User.fromJson(users)).toList();

    } else {
      throw Exception('Failed to fetch data');
    }
  }

  FutureBuilder _usersDisplayData(){
    return FutureBuilder<List<User>>(
      future: getUsers(),
      builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot){
        if (snapshot.hasData) {
          List<User> data = snapshot.data;
          return _createUsersListView(data);
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