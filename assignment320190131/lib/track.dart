import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'styling.dart';
import 'mynav.dart';

class Track extends StatefulWidget {
  const Track({Key? key}) : super(key: key);

  @override
  _TrackState createState() => _TrackState();
}

class _TrackState extends State<Track> with ChangeNotifier {
  String dropdownValue = '1';
  final bitsIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ThemeColors.primaryColor,
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
                              'Assignment Number',
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
                                  for (var i = 1; i <= 6; i += 1) '$i'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: screenSize.height * 0.04,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Score',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                ),
                                TextFormField(
                                  controller: bitsIdController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      fillColor: Colors.grey[200],
                                      filled: true,
                                      labelText: 'Please enter your score'),
                                ),
                              ],
                            ),
                          ]),
                    ])),
            ElevatedButton(
              onPressed: () {
                setIntData(dropdownValue, int.parse(bitsIdController.text));
                notifyListeners();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xff2FC4B2)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ))),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: const Text(
                  'SUBMIT',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ]))),
      bottomNavigationBar: Mynav(),
    );
  }

  setIntData(String key, int value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setInt(key, value);
  }
}
