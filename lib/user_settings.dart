import 'package:clip/config/variables.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  SettingsState createState() => new SettingsState(); 
}

class SettingsState extends State<Settings> {
  @override
  void initState(){
    super.initState();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("User Settings"),
        backgroundColor: USER_COLOR,
      ),
    );
  }
}