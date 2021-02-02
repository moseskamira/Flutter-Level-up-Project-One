import 'package:flutter/material.dart';

class DeleteUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Warning'),
      content: Text('Are You Sure !'),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text('YES'),
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text('NO'),
        )
      ],
    );
  }
}
