import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter/material.dart';

class Timetable extends StatefulWidget {
  @override
  _Timetable createState() => new _Timetable();
}

class _Timetable extends State<Timetable> {
  Widget build (BuildContext) {
    return Scaffold(
      body: new Container(
        child: new CalendarCarousel(

        ),
      ),
    );
  }
}