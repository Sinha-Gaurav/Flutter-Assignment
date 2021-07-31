import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'styling.dart';
import 'mynav.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

enum IdentificationChoice { name, id }

class _SettingsState extends State<Settings> {
  IdentificationChoice? _nametype;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ThemeColors.primaryColor,
      ),
      body: SafeArea(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.06),
              child: Column(
                children: [
                  SizedBox(
                    width: screenSize.width * 0.90,
                    height: screenSize.width * 0.06,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Your Home Bio',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: RadioListTile<IdentificationChoice>(
                          title: const Text('Name'),
                          value: IdentificationChoice.name,
                          groupValue: _nametype,
                          activeColor: Colors.grey,
                          onChanged: (IdentificationChoice? value) {
                            setState(() {
                              setCall("Name");
                              _nametype = value;
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Home()),
                              );
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<IdentificationChoice>(
                          dense: true,
                          title: const Text('ID'),
                          value: IdentificationChoice.id,
                          groupValue: _nametype,
                          activeColor: Colors.grey,
                          onChanged: (IdentificationChoice? value) {
                            setState(
                              () {
                                setCall("ID");
                                _nametype = value;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ))),
      bottomNavigationBar: Mynav(),
    );
  }

  setCall(String w) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    String value1 = myPrefs.getString(w) ?? "";
    myPrefs.setString("Call", value1);
  }
}
