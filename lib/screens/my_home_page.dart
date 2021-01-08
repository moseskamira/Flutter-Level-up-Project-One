import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myFlutterApp/screens/drawer.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormScreenState();
}

class _FormScreenState extends State<MyHomePage> {
  List<String> spinnerItems = ['Male', 'Female', 'Prefer Not To Say'];
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
          autocorrect: true,
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

  Widget buildGenderDropDownRow() => Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Gender:'),
            DropdownButton(
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
            ),
          ],
        ),
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

  Widget buildOtherOptionRadioBtn() => Row(
        children: <Widget>[
          Text("Other"),
          Radio(
            activeColor: Theme.of(context).primaryColor,
            value: nationality[1],
            groupValue: selectedNationality,
            onChanged: (value) {
              setState(() => selectedNationality = value);
            },
          ),
        ],
      );

  Widget buildUgandanRadioBtn() => Row(
        children: <Widget>[
          Text("Ugandan"),
          Radio(
            activeColor: Theme.of(context).primaryColor,
            value: nationality[0],
            groupValue: selectedNationality,
            onChanged: (value) {
              setState(() => selectedNationality = value);
            },
          ),
        ],
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
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            'FaceBook',
            style: new TextStyle(color: Colors.black),
          ),
          Checkbox(
            activeColor: Colors.blue,
            value: _isCheckedFb,
            onChanged: (bool value) =>
                setState(() => _isCheckedFb = !_isCheckedFb),
          ),
        ],
      );

  Widget buildLinkedInRow() => Row(
        children: <Widget>[
          Text(
            "LinkedIn",
            style: new TextStyle(color: Colors.black),
          ),
          Checkbox(
            activeColor: Colors.blue,
            value: _isCheckedLn,
            onChanged: (bool value) =>
                setState(() => _isCheckedLn = !_isCheckedLn),
          ),
        ],
      );

  Widget buildSubmitRegBtn() => Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        child: RaisedButton(
          color: Colors.grey,
          textColor: Colors.black,
          onPressed: processRegData,
          child: Text(
            'Submit'.toUpperCase(),
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      );

  Widget buildHomePageTitle() => Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          'USER REG FORM',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            decoration: TextDecoration.none,
          ),
        ),
      );

  Widget buildFileUploader() => Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Profile Photo:'),
              SizedBox(
                width: 100,
              ),
              IconButton(
                icon: Icon(Icons.attachment_rounded),
                onPressed: getFilePath,
              ),
            ],
          ),
        ),
      );

  void getFilePath() async {
    try {
      filePath = await FilePicker.getFilePath(type: FileType.IMAGE);
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
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text('U.M.S'),
          backgroundColor: Colors.green,
          brightness: Brightness.light,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.all(8),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildHomePageTitle(),
                  buildUserName(),
                  buildEmail(),
                  buildPhoneNumber(),
                  buildPassword(),
                  buildGenderDropDownRow(),
                  buildRadioBtnRow(),
                  buildCheckBoxRow(),
                  buildFileUploader(),
                  SizedBox(height: 5),
                  buildSubmitRegBtn(),
                ],
              ),
            ),
          ),
        ),
        drawer: DrawerWidget(),
      );
}
