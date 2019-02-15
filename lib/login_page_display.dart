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
    return new Scaffold(
      backgroundColor: Colors.green,
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30.0),
            child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
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
                      padding: EdgeInsets.only(top: 10.0),
                    ),
                    new Text(
                      "MyCLIP",
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              new Padding(
                padding: EdgeInsets.only(bottom: 50.0),
              ),
              new Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30.0))
                ),
                child: new TextFormField(
                  validator: (input) {
                    if(input.isEmpty) {
                      return "Please type an email!";
                    }
                  },
                  onSaved: (input) => _email = input,
                  decoration: InputDecoration(
                    icon: new Icon(Icons.mail, color: Colors.green, size: 18.0),
                    labelText: "Email"
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(bottom: 10.0),
              ),
              new Container(
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30.0))
                ),
                child: new TextFormField(
                  validator: (input) {
                    if(input.length < 6) {
                      return "Your password needs to be atleast 6 characters";
                    }
                  },
                  onSaved: (input) => _password = input,
                  decoration: InputDecoration(
                    icon: new Icon(Icons.vpn_key, color: Colors.green, size: 18.0),
                    labelText: "Password"
                  ),
                  obscureText: true,
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(bottom: 20.0),
              ),
              new RaisedButton(
                color: Colors.white,
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                onPressed: signIn,
                child: new Text("Sign in", style: new TextStyle(color: Colors.green)),
              )
            ],
          ),
        ),
      )
    );
  }
}