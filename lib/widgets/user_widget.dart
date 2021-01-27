import 'package:flutter/material.dart';
import 'package:myFlutterApp/provider/user_provider.dart';
import 'package:myFlutterApp/screens/user_details.dart';
import 'package:myFlutterApp/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

import '../util/change_screen.dart';

class UserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    userProvider.loadUsers();
    return userProvider.users.isEmpty
        ? Container(
            child: Center(
              child: LoadingWidget(),
            ),
          )
        : Container(
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
                      ),
                    ),
                  ),
                  onTap: () => changeScreen(
                    context,
                    DetailScreen(detailedUser: userProvider.users[index]),
                  ),
                ),
              ),
            ),
          );
  }
}
