import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();
  String userName;
  String email;
  String password;
  String phoneNumber;

  Widget buildUserName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Enter UserName'),
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'UserName Required !';
        }
      },
      onSaved: (String value) {
        userName = value;
      },
    );
  }

  Widget buildEmail() {
    return TextFormField(decoration: InputDecoration(labelText: 'Enter Email'),
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'userEmail Required !';
        }
        if (!RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
            .hasMatch(value)) {
          return 'Please Enter Valid Email Address !';
        }
      },
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget buildPassword() {
    return TextFormField(decoration: InputDecoration(labelText: 'Enter Password'),
      keyboardType: TextInputType.visiblePassword,
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password Required !';
        }
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget buildPhoneNumber() {
    return TextFormField(decoration: InputDecoration(labelText: 'Enter Phone Number'),
      keyboardType: TextInputType.phone,
      // ignore: missing_return
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone Number Required !';
        }
        if(value.length != 10) {
          return 'Invalid Phone Number Length !';
        }
      },
      onSaved: (String value) {
        phoneNumber = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterApp"),
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              buildUserName(),
              buildEmail(),
              buildPassword(),
              buildPhoneNumber(),
              SizedBox(height: 5),
              RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                  onPressed: () {
                    if (!formKey.currentState.validate()) {
                      return;
                    }
                    formKey.currentState.save();
                    print(userName);
                    print(email);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
