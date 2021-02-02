import 'package:flutter/material.dart';
import 'package:myFlutterApp/provider/user_provider.dart';
import 'package:myFlutterApp/screens/user_details.dart';
import 'package:myFlutterApp/widgets/custom_text.dart';
import 'package:myFlutterApp/widgets/delete_user_widget.dart';
import 'package:myFlutterApp/widgets/loading_widget.dart';
import 'package:provider/provider.dart';

import '../util/change_screen.dart';

class UserWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    userProvider.loadUsers();
    return userProvider.users.isEmpty
        ? Center(child: LoadingWidget())
        : Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: userProvider.users.length,
              itemBuilder: (context, index) => Card(
                child: Dismissible(
                  key: ValueKey(userProvider.users[index].id),
                  direction: DismissDirection.startToEnd,
                  confirmDismiss: (direction) async => await showDialog(
                    context: context,
                    builder: (_) => DeleteUser(),
                  ),
                  onDismissed: (direction) {},
                  background: Container(
                    color: Colors.red,
                    padding: EdgeInsets.only(left: 16),
                    child: Align(
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  child: ListTile(
                    title: CustomText(text: userProvider.users[index].userName),
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
            ),
          );
  }
}
