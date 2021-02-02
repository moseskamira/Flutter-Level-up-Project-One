import 'package:flutter/material.dart';
import 'package:myFlutterApp/widgets/page_title_text.dart';

class DeleteUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      title: Center(
        child: PageTitleText(
          titleText: 'WARNING',
          textColor: Colors.red,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Text(
              'Are You Sure You Want To Delete User?',
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FlatButton(
                    color: Colors.red,
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text(
                      'YES',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  FlatButton(
                    color: Colors.grey,
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text(
                      'NO',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
