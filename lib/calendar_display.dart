import 'package:clip/config/locales.dart';
import 'package:clip/config/variables.dart';
import 'package:flutter/material.dart';

class CalendarDisplay extends StatefulWidget {
  @override
  CalendarDisplayState createState() => new CalendarDisplayState();
}

class CalendarDisplayState extends State<CalendarDisplay> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(LocaleHolder.getValue(CALENDAR)),
        backgroundColor: USER_COLOR,
      ),
      body: new Container(

      ),
    );
  }
}