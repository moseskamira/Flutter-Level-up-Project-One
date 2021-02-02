import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myFlutterApp/provider/user_provider.dart';
import 'package:myFlutterApp/widgets/drawer.dart';
import 'package:myFlutterApp/widgets/page_title_text.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormScreenState();
}

class _FormScreenState extends State<MyHomePage> {
  List<String> spinnerItems = ['Male', 'Female', 'Prefer Not To Say'];
  List nationality = ["Ugandan", "Other"];

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
            // controller: ,
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
            icon: Icon(Icons.lock),
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

  Widget buildHomePageTitle() => Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
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

  Widget buildSubmitButton(UserProvider myProvider) => Container(
        margin: const EdgeInsets.all(8),
        child: RaisedButton(
          color: Colors.grey,
          textColor: Colors.black,
          onPressed: () {
            if (!myProvider.formKey.currentState.validate()) {
              return;
            }
            myProvider.formKey.currentState.save();
            print(selectedNationality);
            print(email);
            print(dropdownValue.toUpperCase());
            print(phoneNumber);
          },
          child: Text(
            'Submit'.toUpperCase(),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
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
    } on PlatformException catch (e) {
      print("Error while picking the file: " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: PageTitleText(
          titleText: 'U.M.S',
          textColor: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: const EdgeInsets.all(8),
        child: Form(
          key: provider.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          onChanged: () {
            Form.of(primaryFocus.context).save();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: PageTitleText(
                        titleText: 'USER REG FORM',
                        textColor: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: buildUserName(),
                    ),
                    Expanded(
                      child: buildEmail(),
                    ),
                    Expanded(
                      child: buildPhoneNumber(),
                    ),
                    Expanded(
                      child: buildPassword(),
                    ),
                    Expanded(
                      child: buildGenderDropDownRow(),
                    ),
                    Expanded(
                      child: buildRadioBtnRow(),
                    ),
                    Expanded(
                      child: buildCheckBoxRow(),
                    ),
                    Expanded(
                      child: buildFileUploader(),
                    ),
                    Expanded(
                      child: buildSubmitButton(provider),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        child: Icon(Icons.add),
        onPressed: null,
      ),
      drawer: DrawerWidget(),
    );
  }
}
