import 'package:clip/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:clip/config/presistent_variables.dart';
import 'package:clip/config/locales.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try {
        FirebaseUser user = await _auth.signInWithEmailAndPassword(email: _email, password: _password);
        if(user != null){
          PreferencesHolder().persistLoginStatus(true);
        }
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SplashScreen()));
      } catch(err) {
        print(err);
      }
    }
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential =GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );

    try{
      final FirebaseUser user = await _auth.signInWithCredential(credential);
      if(user != null){
        PreferencesHolder().persistLoginStatus(true);
      }
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SplashScreen()));
    } catch(err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;

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
          if(input.isEmpty || !input.contains("@campus.fct.unl.pt")){
            return LocaleHolder.getValue(VALIDATE_EMAIL);
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
            return LocaleHolder.getValue(VALIDATE_PASS);
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

    final signInButton = Container(
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.green.shade50,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 280.0,
          height: 42.0,
          onPressed: signIn,
          child: Text(LocaleHolder.getValue(SIGN_IN), style: TextStyle(color: Colors.green, fontSize: 16.0),),
        ),
      ),
    );

    final googleSignInButton = Container(
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.green.shade50,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 280.0,
          height: 42.0,
          onPressed: signInWithGoogle,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Icon(FontAwesomeIcons.google, color: Colors.red),
              Padding(padding: EdgeInsets.symmetric(horizontal: 5.0)),
              Text(LocaleHolder.getValue(GOOGLE_SIGN_IN), style: TextStyle(color: Colors.green, fontSize: 16.0)),
            ] 
          ),
        ),
      )
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
              signInButton,
              Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 7.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: w * 0.30,
                        height: 1.0,
                        color: Colors.white,
                      ),
                      Text(LocaleHolder.getValue(OR_OPTION), style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      Container(
                        width: w * 0.30,
                        height: 1.0,
                        color: Colors.white,
                      ),
                    ],
                  )
                )
              ),
              googleSignInButton,
            ],
          )
        ),
      ),
    );
  }
}