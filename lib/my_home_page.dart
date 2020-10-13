import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FormScreenState();
}

class FormScreenState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  String userName;
  String email;
  String password;
  String phoneNumber;

  Widget buildUserName() => TextFormField(
        decoration: InputDecoration(labelText: 'Enter Name'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'UserName Required!';
          } else if (value.length < 3) {
            return 'Acceptable minimum number of characters is: 3 !';
          }
          return null;
        },
        onSaved: (String value) {
          userName = value;
        },
      );

  Widget buildEmail() => TextFormField(
        decoration: InputDecoration(labelText: 'Enter Email'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'userEmail Required !';
          } else if (!RegExp(
                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
              .hasMatch(value)) {
            return 'Enter Valid Email Address !';
          }
          return null;
        },
        onSaved: (String value) {
          email = value;
        },
      );

  Widget buildPassword() => TextFormField(
        decoration: InputDecoration(labelText: 'Enter Password'),
        obscureText: true,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Password Required !';
          }
          return null;
        },
        onSaved: (value) => setState(() => password = value),
  );

  Widget buildPhoneNumber() => TextFormField(
      decoration: InputDecoration(labelText: 'Enter Phone Number'),
      keyboardType: TextInputType.phone,
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone Number Required !';
        } else if (value.length != 10) {
          return 'Invalid Phone Number Length !';
        }
        return null;
      },
      onSaved: (value) =>
          setState(() => phoneNumber = value.toString().trim())
  );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("FlutterApp"),
        ),
        body: Container(
          margin: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  child: Text('USER REGISTRATION FORM',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      )),
                ),
                SizedBox(height: 5),
                buildUserName(),
                buildEmail(),
                buildPassword(),
                buildPhoneNumber(),
                SizedBox(height: 5),
                RaisedButton(
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    onPressed: () {
                      if (!_formKey.currentState.validate()) {
                        return;
                      }
                      _formKey.currentState.save();
                      print(userName);
                      print(email);
                      print(password);
                      print(Icons.phone);
                    })
              ],
            ),
          ),
        ),
      );
}
