import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:myFlutterApp/screens/users_view.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FormScreenState();
}

class FormScreenState extends State<MyHomePage> {
  List<String> spinnerItems = ['Male', 'Female'];
  List nationality = ["Ugandan", "Other"];
  final _formKey = GlobalKey<FormState>();
  String dropdownValue,
      selectedNationality,
      userName,
      email,
      password,
      phoneNumber;

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

  Widget buildDropDownRow() => Row(
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
      );

  Widget buildUgandanRadioBtn() => Row(
        children: <Widget>[
          Radio(
            activeColor: Theme.of(context).primaryColor,
            value: nationality[0],
            groupValue: selectedNationality,
            onChanged: (value) {
              setState(() {
                selectedNationality = value;
              });
            },
          ),
          Text("Ugandan"),
        ],
      );

  Widget buildOtherOptionRadioBtn() => Row(
        children: <Widget>[
          Radio(
            activeColor: Theme.of(context).primaryColor,
            value: nationality[1],
            groupValue: selectedNationality,
            onChanged: (value) {
              setState(() {
                selectedNationality = value;
              });
            },
          ),
          Text("Other")
        ],
      );

  Widget buildRadioBtnRow() => Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Nationality:'),
          buildUgandanRadioBtn(),
          buildOtherOptionRadioBtn(),
        ],
      );

  Widget buildSubmitRegBtn() => RaisedButton(
      color: Colors.blue,
      textColor: Colors.white,
      child: Text(
        'Submit'.toUpperCase(),
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      onPressed: processRegData,
  );

  void processRegData() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    print(selectedNationality);
    print(email);
    print(dropdownValue.toUpperCase());
    print(phoneNumber);

  }

  Widget buildHomePageTitle() => Text(
        'USER REG FORM',
        style: TextStyle(
          fontSize: 24,
          color: Colors.black,
        ),
      );

  Widget buildDrawerHeader() => DrawerHeader(
      decoration: BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage('assets/images/user.jpeg'))),
      child: Stack(children: <Widget>[
        Positioned(
          bottom: 4.0,
          left: 16.0,
          child: Text(
            'USER MANAGEMENT SYSTEM',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w500),
          ),
        ),
      ]));

  Future navigateToUsersView(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => UsersView()));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("USER MANAGEMENT SYSTEM"),
          backgroundColor: Colors.green,
          brightness: Brightness.light,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 16),
                  buildHomePageTitle(),
                  buildUserName(),
                  buildEmail(),
                  buildPassword(),
                  buildPhoneNumber(),
                  buildDropDownRow(),
                  buildRadioBtnRow(),
                  SizedBox(height: 5),
                  buildSubmitRegBtn(),
                ],
              ),
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              buildDrawerHeader(),
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
}
