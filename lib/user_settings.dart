import 'package:clip/config/locales.dart';
import 'package:clip/config/presistent_variables.dart';
import 'package:clip/config/variables.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  SettingsState createState() => new SettingsState(); 
}

class SettingsState extends State<Settings> {
  String _selected = LocaleHolder.LOCALE;

  @override
  void initState(){
    super.initState();
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final w = size.width;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(LocaleHolder.getValue(SETTINGS)),
        backgroundColor: USER_COLOR,
      ),
      body: new Container(
        child: new ListView(
          children: <Widget>[
            new Padding(padding: EdgeInsets.only(top: 5.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(Icons.language, color: USER_COLOR),
                new Padding(
                  padding: EdgeInsets.only(right: 5.0),
                ),
                new Text(
                  LocaleHolder.getValue(LANGUAGE),
                  style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: USER_COLOR
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.only(right: w * 0.25),
                ),
                new DropdownButton(
                  value: _selected,
                  items: [
                    new DropdownMenuItem(
                      child: new Text(LocaleHolder.getValue(PORTUGUESE)),
                      value: "pt",
                    ),
                    new DropdownMenuItem(
                      child: new Text(LocaleHolder.getValue(ENGLISH)),
                      value: "en",
                    )
                  ],
                  onChanged: (String value) {
                    setState(() {
                      _selected = value;
                      LocaleHolder.LOCALE = value;
                      PreferencesHolder().persistLanguageSetting(value);
                    });
                  },
                  hint: new Text(LocaleHolder.getValue(LANGUAGE)),
                ),
              ],
            ),
            new Divider(
              color: USER_COLOR,
            )
          ],
        )
      ),
    );
  }
}