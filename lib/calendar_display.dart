import 'package:clip/config/locales.dart';
import 'package:clip/config/variables.dart';
import 'package:flutter/material.dart';

class CalendarDisplay extends StatefulWidget {
  @override
  CalendarDisplayState createState() => new CalendarDisplayState();
}

class CalendarDisplayState extends State<CalendarDisplay> {

  final months = [
    LocaleHolder.getValue(JANUARY),
    LocaleHolder.getValue(FEBRUARY),
    LocaleHolder.getValue(MARCH),
    LocaleHolder.getValue(APRIL),
    LocaleHolder.getValue(MAY),
    LocaleHolder.getValue(JUNE),
    LocaleHolder.getValue(JULY),
    LocaleHolder.getValue(AUGUST),
    LocaleHolder.getValue(SEPTEMBER),
    LocaleHolder.getValue(OCTOBER),
    LocaleHolder.getValue(NOVEMBER),
    LocaleHolder.getValue(DECEMBER)
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text(LocaleHolder.getValue(CALENDAR)),
        backgroundColor: USER_COLOR,
      ),
      body: PageView.builder(
        controller: PageController(initialPage: DateTime.now().month + 47),
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Container(
                color: USER_COLOR,
                margin: EdgeInsets.only(bottom: 4.0),
                padding: EdgeInsets.only(top: 0.0, bottom: 8.0),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    Text(
                      months[index % months.length],
                      style:TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold)
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white
                    )
                  ],
                ),
              ),
              Container(
                child: new Column(
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        },
      )
    );
  }
}