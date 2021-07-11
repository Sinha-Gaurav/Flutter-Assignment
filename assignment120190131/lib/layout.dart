import 'package:flutter/material.dart';
import 'rectangle.dart';
import 'square.dart';
import 'squarec.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Rectangle(),
          Square(),
          Rectangle(),
          Rectangle(),
          SquaRec(),
        ],
      ),
    );
  }
}
