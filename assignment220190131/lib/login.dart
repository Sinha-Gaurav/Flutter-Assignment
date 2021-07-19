import 'package:flutter/material.dart';
import 'register.dart';
import 'greetings.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Column(
              children: [
                Text(
                  'CRUX FLUTTER',
                  style: TextStyle(
                    color: Color(0xff2FC4B2),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'SUMMER GROUP',
                  style: TextStyle(
                      color: Color(0xff2FC4B2),
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const DataFields(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account ",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Register()),
                  );
                },
                child: const Text(
                  'Register',
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
    );
  }
}

class DataFields extends StatefulWidget {
  const DataFields({Key? key}) : super(key: key);

  @override
  State<DataFields> createState() => _DataFieldsState();
}

/// This is the private State class that goes with DataFields.
class _DataFieldsState extends State<DataFields> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String value = '\0';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
                alignment: Alignment.centerLeft,
                child: new Text(
                  "ID Number",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: TextFormField(
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
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: new Text(
                        "Password",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: TextFormField(
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 46.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState!.validate()) {
                    // Process data.
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Greetings(value)),
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
                  'LOG IN',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text(
                'Forgot Password ?',
                style: TextStyle(
                  color: Color(0xff2FC4B2),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
