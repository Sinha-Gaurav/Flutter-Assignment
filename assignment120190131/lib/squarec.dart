import 'package:flutter/material.dart';

class SquaRec extends StatelessWidget {
  Widget box({w: 80.0, h: 80.0}) {
    return Container(
      height: h,
      width: w,
      color: Colors.grey,
    );
  }

  Widget leftcol() {
    return Container(
      height: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          box(),
          box(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          leftcol(),
          box(w: 180.0, h: 180.0),
        ],
      ),
    );
  }
}
