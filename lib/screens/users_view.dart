import 'package:flutter/material.dart';
import 'package:myFlutterApp/provider/user_provider.dart';
import 'package:myFlutterApp/screens/change_screen.dart';
import 'package:myFlutterApp/screens/user_details.dart';
import 'package:provider/provider.dart';

class UsersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('U.M.S'),
          brightness: Brightness.light,
        ),
        backgroundColor: Colors.white,
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: userProvider.users.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(userProvider.users[index].userName,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      )),
                  subtitle: Text(userProvider.users[index].profileUrl),
                  leading: Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                userProvider.users[index].profileImage),
                          ))),
                  onTap: () => changeScreen(context,
                      DetailScreen(detailedUser: userProvider.users[index])),
                ),
              ),
            )));
  }
}
