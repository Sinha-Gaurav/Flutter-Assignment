import 'home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'register.dart';
import 'styling.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final bitsIdController = TextEditingController();
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // MediaQuery for screenSizes
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              width: screenSize.width * 0.90,
              height: screenSize.height * 0.20,
              child: Text(
                'CRUX FLUTTER SUMMER GROUP',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ThemeColors.primaryColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 35,
                ),
              ),
            ),
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
                        ),
                      ),
                      TextFormField(
                        controller: bitsIdController,
                        decoration: InputDecoration(
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
                        child: Text('Name'),
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          fillColor: Colors.grey[200],
                          filled: true,
                          labelText: 'Please enter your name',
                        ),
                      ),
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
                      onPressed: () {
                        setID(bitsIdController.text);
                        setName(nameController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      child: Text(
                        'LOG IN',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: screenSize.width * 0.90,
                  height: screenSize.height * 0.04,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Forgot Password ?'),
                    style:
                        TextButton.styleFrom(primary: ThemeColors.primaryColor),
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
                  Text('Don\'t have an account'),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: Text('Register'),
                    style:
                        TextButton.styleFrom(primary: ThemeColors.primaryColor),
                  )
                ],
              ),
            ),
          ],
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
