import 'package:flutter/material.dart';
import 'greetings.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Color(0xff2FC4B2),
        title: Text(
          'CRUX FLUTTER SUMMER GROUP',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const Entries(),
    );
  }
}

enum Question { yes, no }

class Entries extends StatefulWidget {
  const Entries({Key? key}) : super(key: key);

  @override
  State<Entries> createState() => _EntriesState();
}

/// This is the private State class that goes with Entries.
class _EntriesState extends State<Entries> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropdownValue = '2020';
  bool isSwitched = false;
  String value = '\0';
  Question? _answer = Question.yes;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: new Text(
                        "ID Number",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      )),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    fillColor: Color(0xffe0dfdc),
                    filled: true,
                    hintText: 'Please enter your BITS ID Number',
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(0.0),
                      ),
                    ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (text) {
                    value = text;
                  },
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: new Text(
                        "Password",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      )),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    fillColor: Color(0xffe0dfdc),
                    filled: true,
                    hintText: 'Please enter your password',
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(0.0),
                      ),
                    ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: new Text(
                        "Batch",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      )),
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    fillColor: Color(0xffe0dfdc),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(0.0),
                      ),
                    ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  value: dropdownValue,
                  icon: const Icon(Icons.expand_more),
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['2020', '2019', '2018', '2017', '2016']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Receive Regular Updates",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                      print(isSwitched);
                    });
                  },
                  activeTrackColor: Color(0xff2FC4B2),
                  activeColor: Color(0xff2FC4B2),
                  inactiveTrackColor: Color(0xffe0dfdc),
                  inactiveThumbColor: Color(0xff2FC4B2),
                ),
              ],
            ),
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Are you excited for this !!",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: const Text(
                          'Yes',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        leading: Radio<Question>(
                          activeColor: Colors.grey,
                          value: Question.yes,
                          groupValue: _answer,
                          onChanged: (Question? value) {
                            setState(() {
                              _answer = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text(
                          'No',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        leading: Radio<Question>(
                          activeColor: Colors.grey,
                          value: Question.no,
                          groupValue: _answer,
                          onChanged: (Question? value) {
                            setState(() {
                              _answer = value;
                            });
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState!.validate()) {
                      // Process data.
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Greetings(value)),
                      );
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff2FC4B2)),
                      minimumSize: MaterialStateProperty.all<Size>(
                          Size(MediaQuery.of(context).size.width, 50.0)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ))),
                  child: const Text(
                    'REGISTER',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xff2FC4B2),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
