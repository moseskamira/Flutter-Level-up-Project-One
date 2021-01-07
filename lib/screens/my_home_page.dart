import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myFlutterApp/screens/drawer.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormScreenState();
}

class _FormScreenState extends State<MyHomePage> {
  List<String> spinnerItems = ['Male', 'Female'];
  List nationality = ["Ugandan", "Other"];
  final _formKey = GlobalKey<FormState>();
  String dropdownValue,
      selectedNationality,
      userName,
      email,
      password,
      phoneNumber,
      filePath;
  bool _isCheckedFb = false;
  bool _isCheckedLn = false;

  Widget buildUserName() => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Enter Your Name',
            border: InputBorder.none,
            icon: Icon(Icons.person),
          ),
          keyboardType: TextInputType.name,
          validator: (String value) {
            if (value.isEmpty) {
              return 'UserName Required!';
            } else if (value.length < 3) {
              return 'Acceptable minimum number of characters is: 3 !';
            }
            return null;
          },
          onSaved: (String value) => setState(() => userName = value),
        ),
      );

  Widget buildEmail() => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Enter Your Email',
              border: InputBorder.none,
              icon: Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
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
            onSaved: (String value) => setState(() => email = value)),
      );

  Widget buildPassword() => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Enter Your Password',
            border: InputBorder.none,
          ),
          obscureText: true,
          validator: (String value) {
            if (value.isEmpty) {
              return 'Password Required !';
            }
            return null;
          },
          onSaved: (value) => setState(() => password = value),
        ),
      );

  Widget buildPhoneNumber() => Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: TextFormField(
            decoration: InputDecoration(
              labelText: 'Enter Phone Number',
              border: InputBorder.none,
              icon: Icon(Icons.phone),
            ),
            keyboardType: TextInputType.phone,
            validator: (String value) {
              if (value.isEmpty) {
                return 'Phone Number Required !';
              } else if (value.length != 10) {
                return 'Invalid Phone Number Length !';
              }
              return null;
            },
            onSaved: (value) =>
                setState(() => phoneNumber = value.toString().trim())),
      );

  Widget buildGenderDropDownWidget() => DropdownButton(
        hint: Text('Select Your Gender:'),
        items: spinnerItems
            .map(
              (gender) => DropdownMenuItem(
                child: Text(gender),
                value: gender,
              ),
            )
            .toList(),
        value: dropdownValue,
        onChanged: (newValue) => setState(() => dropdownValue = newValue),
      );

  Widget buildDropDownRow() => Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Gender:'),
            buildGenderDropDownWidget(),
          ],
        ),
      );

  Widget buildUgandanRadioBtn() => Row(
        children: <Widget>[
          Radio(
            activeColor: Theme.of(context).primaryColor,
            value: nationality[0],
            groupValue: selectedNationality,
            onChanged: (value) {
              setState(() => selectedNationality = value);
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
              setState(() => selectedNationality = value);
            },
          ),
          Text("Other")
        ],
      );

  Widget buildRadioBtnRow() => Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Nationality:',
            ),
            buildUgandanRadioBtn(),
            buildOtherOptionRadioBtn(),
          ],
        ),
      );

  Widget buildCheckBoxRow() => Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Social Media:",
              style: new TextStyle(color: Colors.black),
            ),
            buildFaceBookRow(),
            buildLinkedInRow(),
          ],
        ),
      );

  Widget buildFaceBookRow() => Row(
        children: <Widget>[
          Checkbox(
            activeColor: Colors.blue,
            value: _isCheckedFb,
            onChanged: (bool value) =>
                setState(() => _isCheckedFb = !_isCheckedFb),
          ),
          GestureDetector(
            // onTap: () => print("Remember me"),
            child: Text(
              "FaceBook",
              style: new TextStyle(color: Colors.black),
            ),
            onTap: () {
              print("You Tapped Me");
            },
          ),
        ],
      );

  Widget buildLinkedInRow() => Row(
        children: <Widget>[
          Checkbox(
              activeColor: Colors.blue,
              value: _isCheckedLn,
              onChanged: (bool value) =>
                  setState(() => _isCheckedLn = !_isCheckedLn)),
          GestureDetector(
            // onTap: () => print("Remember me"),
            child: Text(
              "LinkedIn",
              style: new TextStyle(color: Colors.black),
            ),
          )
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

  Widget buildHomePageTitle() => Text(
        'USER REG FORM',
        style: TextStyle(
          fontSize: 24,
          color: Colors.black,
          decoration: TextDecoration.underline,
        ),
      );

  void getFilePath() async {
    try {
      filePath = await FilePicker.getFilePath(type: FileType.ANY);
      if (filePath == '') {
        return;
      }
      setState(() => filePath = filePath);
      print("SELECTEDFILEPATH: " + filePath);
    } on PlatformException catch (e) {
      print("Error while picking the file: " + e.toString());
    }
  }

  void processRegData() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    print(selectedNationality);
    print(email);
    print(dropdownValue.toUpperCase());
    print(phoneNumber);
    // getFilePath();
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
          child: Container(
            // decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            margin: const EdgeInsets.all(8),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildHomePageTitle(),
                    buildUserName(),
                    buildEmail(),
                    buildPhoneNumber(),
                    buildPassword(),
                    buildDropDownRow(),
                    buildRadioBtnRow(),
                    buildCheckBoxRow(),
                    // buildFileUploader(),
                    SizedBox(height: 5),
                    buildSubmitRegBtn(),
                  ],
                ),
              ),
            ),
          ),
        ),
        drawer: DrawerWidget(),
      );
}
