import 'package:clip/config/locales.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:clip/config/presistent_variables.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      Timer(
        Duration(seconds: 3),
        () async {
          LocaleHolder.LOCALE = await PreferencesHolder().languageSet(); 
          final signedIn = await PreferencesHolder().isSignedIn();
          if(signedIn){
              Navigator.of(context).pushReplacementNamed("/Tabs");
            } else {
              Navigator.of(context).pushReplacementNamed("/LoginPage");
            }
        }
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(color: Colors.green),
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: new Container(
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
              ),
              new Expanded(
                flex: 1,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                    new Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    new Text("CLIP in your pocket!", style: new TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold
                      )
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}