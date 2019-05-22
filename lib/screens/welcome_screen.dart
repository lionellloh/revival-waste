import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenUnitHeight = screenSize.height / 100;
    double screenUnitWidth = screenSize.width / 100;

    return new Container(
        child: new Column(
      children: <Widget>[
        Container(
          height: screenUnitHeight * 65,
        ),
        roundedGradientButton("Sign Up", screenUnitWidth, screenUnitHeight),
        Container(
          height: screenUnitHeight * 1,
        ),
        normalButton("Login", screenUnitWidth, screenUnitHeight),
        
      ],
    ));
  }
}

roundedGradientButton(text, screenUnitWidth, screenUnitHeight) {
  return new GestureDetector(
    onTap: ()=>print("tapped"),
    child: Container(
    width: 60 * screenUnitWidth,
    height: 6 * screenUnitHeight,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: <Color>[Color(0xFF547980), Color(0xFF45ADA8)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[500],
            offset: Offset(0.0, 1.5),
            blurRadius: 1,
          ),
        ]),
    child: new Center(
        child: Text(text,
            style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                color: Colors.white))),
  )); }

  normalButton(text, screenUnitWidth, screenUnitHeight) {
  return new GestureDetector(
    onTap: ()=>print("tapped"),
    child: Container(
    width: 40 * screenUnitWidth,
    height: 6 * screenUnitHeight,
    padding: EdgeInsets.only(top: 5),
    child: new Center(
        child: Text(text,
            style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                color: Colors.black))),
  ));

}
