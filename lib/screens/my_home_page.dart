import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:myFlutterApp/screens/users_view.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FormScreenState();
}

class FormScreenState extends State<MyHomePage> {
  String dropdownValue;
  List<String> spinnerItems = ['Male', 'Female'];
  List nationality = ["Ugandan", "Other"];
  String selectedNationality;

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
          setState(() => phoneNumber = value.toString().trim()));

  Widget buildGenderDropDownWidget() => DropdownButton(
        hint: Text('Select Gender:'),
        value: dropdownValue,
        onChanged: (newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: spinnerItems.map((gender) {
          return DropdownMenuItem(
            child: new Text(gender),
            value: gender,
          );
        }).toList(),
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("USER MANAGEMENT SYSTEM"),
        ),
        body: Container(
          margin: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.center,
                        child: Text('USER REG FORM',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    Expanded(
                      child: new Padding(
                        padding: EdgeInsets.zero,
                        child: buildUserName(),
                      ),
                    ),
                    Expanded(
                      child: new Padding(
                        padding: EdgeInsets.zero,
                        child: buildEmail(),
                      ),
                    ),
                    Expanded(
                      child: new Padding(
                        padding: EdgeInsets.zero,
                        child: buildPassword(),
                      ),
                    ),
                    Expanded(
                      child: new Padding(
                        padding: EdgeInsets.zero,
                        child: buildPhoneNumber(),
                      ),
                    ),
                    new Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: new Padding(
                            padding: EdgeInsets.zero,
                            child: Text('Gender:'),
                          ),
                        ),
                        Expanded(
                          child: new Padding(
                            padding: EdgeInsets.zero,
                            child: Container(
                              height: 40,
                              padding: EdgeInsets.zero,
                              child: buildGenderDropDownWidget(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: new Padding(
                            padding: EdgeInsets.zero,
                            child: Text('Nationality:'),
                          ),
                        ),
                        Expanded(
                          child: new Row(
                            children: <Widget>[
                              Radio(
                                activeColor: Theme.of(context).primaryColor,
                                value: nationality[0],
                                groupValue: selectedNationality,
                                onChanged: (value) {
                                  setState(() {
                                    print(value);
                                    selectedNationality = value;
                                  });
                                },
                              ),
                              Text("Ugandan"),
                            ],
                          ),
                        ),
                        Expanded(
                          child: new Row(
                            children: <Widget>[
                              Radio(
                                activeColor: Theme.of(context).primaryColor,
                                value: nationality[1],
                                groupValue: selectedNationality,
                                onChanged: (value) {
                                  setState(() {
                                    print(value);
                                    selectedNationality = value;
                                  });
                                },
                              ),
                              Text("Other")
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        child: Text(
                          'Submit'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }
                          _formKey.currentState.save();
                          print(selectedNationality);
                          print(email);
                          print(dropdownValue.toUpperCase());
                          print(phoneNumber);
                        })
                  ],
                ),
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/images/user.jpeg'))),
                  child: Stack(children: <Widget>[
                    Positioned(
                        bottom: 4.0,
                        left: 16.0,
                        child: Text('USER MANAGEMENT SYSTEM',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500))),
                  ])),
              ListTile(
                title: Text('View Users List'),
                onTap: () {
                  navigateToUsersView(context);
                },
              ),
              ListTile(
                title: Text('Update User Info'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );

  Future navigateToUsersView(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => UsersView()));
  }
}
