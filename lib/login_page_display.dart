import 'package:clip/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SplashScreen()));
      } catch(err) {
        print(err);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final logo = new Column(
      children: <Widget> [
        new CircleAvatar(
          backgroundColor: Colors.white,
          radius: 60.0,
          child: new Icon(
            Icons.attach_file,
            color: Colors.green,
            size: 100.0,
          ),
        ),
        new Padding(
          padding: EdgeInsets.only(bottom: 10.0),
        ),
        new Text(
          "MyCLIP",
          style: new TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.bold)
          )
      ]
    );

    final email = new Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.white,
      child: new TextFormField(
        validator: (input) {
          if(input.isEmpty) {
            return "Please type an email!";
          }
        },
        onSaved: (input) => _email = input,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: new Icon(Icons.mail, color: Colors.green, size: 18.0),
          labelText: "Email",
          labelStyle: new TextStyle(color: Colors.green)
        ),
      ),
    );

    final password =  new Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.white,
      child: new TextFormField(
        validator: (input) {
          if(input.length < 6) {
            return "Your password needs to be atleast 6 characters";
          }
        },
        onSaved: (input) => _password = input,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: new Icon(Icons.vpn_key, color: Colors.green, size: 18.0),
          labelText: "Password",
          labelStyle: new TextStyle(color: Colors.green)
        ),
        obscureText: true,
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.green.shade50,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 280.0,
          height: 42.0,
          onPressed: signIn,
          child: Text('Log In', style: TextStyle(color: Colors.green, fontSize: 16.0),),
        ),
      ),
    );

    return new Scaffold(
      backgroundColor: Colors.green,
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 30.0),
              email,
              SizedBox(height: 10.0),
              password,
              SizedBox(height: 15.0),
              loginButton
            ],
          )
        ),
      ),
    );
  }
}