import 'package:flutter/material.dart';
import 'package:http/http.dart' show post;
import 'dart:convert';
import 'welcome_screen.dart';


class SignupScreen extends StatefulWidget {
  createState() {
    return SignupScreenState();
  }
}

class SignupScreenState extends State<SignupScreen> {

  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  static const String URL = "None";
  String email = '';
  String username = '';
  String password = '';
  String confirmedPassword = '';
  var _isLoading = false; 

  @override
  Widget build(context) {
    Size screenSize = MediaQuery.of(context).size;
    double screenUnitHeight = screenSize.height / 100;
    double screenUnitWidth = screenSize.width / 100;

    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      key: _scaffoldKey,
      body: new Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
          Container(margin: EdgeInsets.only(top: screenUnitHeight*5)),
          Align(
            alignment: Alignment.topLeft,
            child: backButton(context)),
          Container(margin: EdgeInsets.only(top: screenUnitHeight * 1)),
          Align(
            alignment: Alignment.topLeft,
            child: textWidget("Signup", 30.0, Colors.black),),
          Container(margin: EdgeInsets.only(top: screenUnitHeight * 5)),
          usernameField(),          
          emailField(),
          passwordField(),
          confirmPasswordField(),
          Container(margin: EdgeInsets.only(top: screenUnitHeight * 5)),
          _isLoading ? 
                    CircularProgressIndicator() : 
                    roundedGradientButtonCallback("Sign Up", signUpCallback, context, screenUnitWidth, screenUnitHeight),
          Container(margin: EdgeInsets.only(top: screenUnitHeight * 4)),
          Align(
            alignment: Alignment.center,
            child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              textWidget("Already have an account?", 13.0, Colors.grey),
              Container(margin: EdgeInsets.only(right: screenUnitWidth * 1)),
              textWidget('Sign in', 13.0, Colors.black)
            ]
          ),
          )
          
          // Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.width/10 )),
          // _isLoading ? CircularProgressIndicator() : submitButton(),
          // welcomePageButton(),
          // // socketButton(),
          // multiplayerGameButton(),
          // cameraButton()
          
        ]),
      ),
    )
    );
    
  }

  void signUpCallback(){
    setState(() {
          _isLoading = true;
        });
    print("signing up");
  }
  Widget backButton(context){
    return IconButton(
            color: Colors.grey,
            iconSize: 40,
            icon: Icon(Icons.arrow_back),
            tooltip: 'Go backk',
            onPressed: () {
              Navigator.of(context).pop();   
    });
    }

  Widget usernameField() {
    return TextFormField(
      key : Key("username"),
      decoration: InputDecoration(
        labelText: 'Username',
        hintText: 'e.g. johndoe96',
      ),
      
      // validator: validateUsername,
      
      onSaved: (String value) {
        username = value;
        print(value);
      },
    );
  }

  Widget emailField() {
    return TextFormField(
      key : Key("email"),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'revivalwaste@gmail.com',
      ),
      // validator: validateEmail,
      onSaved: (String value) {
        email = value;
        print(value);
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      key : Key("password"),
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
      ),
      // validator: validatePassword,
      onSaved: (String value) {
        password = value;
        
      },
    );
  }

  Widget confirmPasswordField() {
    return TextFormField(
      key : Key("confirmed password"),
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Confirm Password',
        hintText: 'Enter your password',
      ),
      // validator: validatePassword,
      onSaved: (String value) {
        confirmedPassword = value;
  
      },
    );
  }

  Widget textWidget(text, size, color){
    return Text(text,
            style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: size,
                color: color));
  }

  Widget roundedGradientButtonCallback(text, callback, context, screenUnitWidth, screenUnitHeight) {
  return new GestureDetector(
    onTap: ()=> callback(),
    child: Container(
    width: 70 * screenUnitWidth,
    height: 5 * screenUnitHeight,
    decoration: 
    BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        gradient: LinearGradient(
          colors: <Color>[Color(0xFF547980), Color(0xFF45ADA8)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[600],
            offset: Offset(5, 7),
            blurRadius: 5,
          ),
        ]),
    child: new Center(
        child: Text(text,
            style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 17,
                color: Colors.white))),
  )); }


  
  
  }