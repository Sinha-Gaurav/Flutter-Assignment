import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  Widget box() {
    return Container(
      height: 80,
      width: 80,
      color: Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          box(),
          box(),
          box(),
        ],
      ),
    );
  }
}
