import 'home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import 'styling.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

enum ExcitedChoice { yes, no }

class _RegisterState extends State<Register> {
  final bitsIdController = TextEditingController();
  bool _updates = false;
  ExcitedChoice? _character = ExcitedChoice.yes;
  String dropdownValue = '2020';
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.primaryColor,
        leading: Container(),
        automaticallyImplyLeading: false,
        title: Text(
          'CRUX FLUTTER SUMMER GROUP',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: screenSize.width * 0.90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: screenSize.height * 0.04,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'ID Number',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        TextFormField(
                          controller: bitsIdController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              fillColor: Colors.grey[200],
                              filled: true,
                              labelText: 'Please enter your BITS ID Number'),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: screenSize.width * 0.90,
                      height: screenSize.width * 0.06,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: screenSize.height * 0.04,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Name',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.grey[200],
                            filled: true,
                            labelText: 'Please enter your name',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: screenSize.width * 0.90,
                      height: screenSize.width * 0.06,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: screenSize.height * 0.04,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Batch',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        Container(
                          height: screenSize.height * 0.07,
                          padding:
                              EdgeInsets.only(left: screenSize.width * 0.03),
                          color: Colors.grey[200],
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              icon: Icon(
                                Icons.expand_more_sharp,
                              ),
                              dropdownColor: Colors.grey[200],
                              isExpanded: true,
                              value: dropdownValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>[
                                for (var i = 2017; i <= 2021; i += 1) '$i'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenSize.width * 0.90,
                          height: screenSize.width * 0.06,
                        ),
                        SwitchListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: const Text(
                            'Receive Regular Updates',
                            style: TextStyle(fontSize: 17),
                          ),
                          value: _updates,
                          inactiveThumbColor: ThemeColors.primaryColor,
                          activeColor: ThemeColors.primaryColor,
                          onChanged: (bool value) {
                            setState(() {
                              _updates = value;
                            });
                          },
                        ),
                        SizedBox(
                          width: screenSize.width * 0.90,
                          height: screenSize.width * 0.06,
                        ),
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Are you excited for this !!',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: RadioListTile<ExcitedChoice>(
                                    title: const Text('Yes'),
                                    value: ExcitedChoice.yes,
                                    groupValue: _character,
                                    onChanged: (ExcitedChoice? value) {
                                      setState(() {
                                        _character = value;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile<ExcitedChoice>(
                                    dense: true,
                                    title: const Text('No'),
                                    value: ExcitedChoice.no,
                                    groupValue: _character,
                                    onChanged: (ExcitedChoice? value) {
                                      setState(
                                        () {
                                          _character = value;
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    width: screenSize.width * 0.90,
                    height: screenSize.height * 0.08,
                    child: Card(
                      color: ThemeColors.primaryColor,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          textStyle: const TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          setID(bitsIdController.text);
                          setName(nameController.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                          );
                        },
                        child: Text('REGISTER'),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: screenSize.width * 0.9,
                alignment: Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text('Login'),
                      style: TextButton.styleFrom(
                          primary: ThemeColors.primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  setName(String value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setString("Name", value);
  }

  setID(String value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setString("ID", value);
  }
}
