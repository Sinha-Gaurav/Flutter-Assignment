import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'mynav.dart';
import 'styling.dart';
import 'track.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _score = 0;
  int _comp = 0;
  double _per = 0.0;
  String _call = "";

  @override
  void initState() {
    super.initState();
    _loadScore();
    _loadComp();
    _loadCall();
  }

  void _loadCall() async {
    final prefs2 = await SharedPreferences.getInstance();
    String temp2 = "";
    temp2 = prefs2.getString("Call") ?? "";
    setState(() {
      _call = temp2;
    });
  }

  void _loadComp() async {
    final prefs1 = await SharedPreferences.getInstance();
    int temp = 0;
    for (int i = 1; i <= 6; i++) {
      if (prefs1.getInt('$i') != null) temp++;
    }
    double temp1 = double.parse(((temp / 6) * 100).toStringAsFixed(2));
    setState(() {
      _comp = temp;
      _per = temp1;
    });
  }

  void _loadScore() async {
    final prefs = await SharedPreferences.getInstance();
    int temp = 0;
    for (int i = 1; i <= 6; i++) {
      temp += (prefs.getInt('$i') ?? 0);
    }
    setState(() {
      _score = temp;
    });
  }

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
            Text(
              "Hi $_call !",
              style: TextStyle(fontSize: 30),
            ),
            Container(
              width: screenSize.width * 0.90,
              decoration: BoxDecoration(
                  color: ThemeColors.primaryColor.withOpacity(0.25),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0))),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Your Progress",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: screenSize.height * 0.05,
                        ),
                        Text(
                          "$_comp/6",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "assignments done",
                          style: TextStyle(fontSize: 17),
                        )
                      ],
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: new BoxDecoration(
                        color: ThemeColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child: Text(
                        "$_per%",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      )),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: screenSize.width * 0.90,
              child: Column(children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Your Score",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: new BoxDecoration(
                        color: ThemeColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child: Text(
                        "$_score",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      )),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Track()),
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              ThemeColors.primaryColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ))),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        child: const Text(
                          'TRACK',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            )
          ]))),
      bottomNavigationBar: Mynav(),
    );
  }
}
