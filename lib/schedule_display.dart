import 'package:clip/config/locales.dart';
import 'package:clip/config/variables.dart';
import 'package:flutter/material.dart';
import 'package:clip/subject_info.dart';
import 'package:clip/networking/subject_endpoint.dart';

class ScheduleDisplay extends StatefulWidget {
  @override
  ScheduleDisplayState createState() => new ScheduleDisplayState();
}

class ScheduleDisplayState extends State<ScheduleDisplay> with SingleTickerProviderStateMixin {
  final days = [
    LocaleHolder.getValue(MONDAY),
    LocaleHolder.getValue(TUESDAY),
    LocaleHolder.getValue(WEDNESDAY),
    LocaleHolder.getValue(THURSDAY),
    LocaleHolder.getValue(FRIDAY)
  ];

  Widget buildNewShift(String startHour, endHour, subjectName, location, shift) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;
    return new Row(
      children: <Widget>[
        new Container(
          margin: EdgeInsets.only(right: w * 0.01),
          padding: EdgeInsets.symmetric(horizontal: w * 0.02),
          height: h * 0.12,
          decoration: new BoxDecoration(
            color: USER_COLOR,
            border: Border.all(width: 2.5, color: USER_COLOR),
            borderRadius: const BorderRadius.all(const Radius.circular(5))
          ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Text(startHour, style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              new Text(endHour, style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
            ],
          ),
        ),
        new Expanded(
          child: new GestureDetector(
            child: new Container(
              height: h * 0.12,
              decoration: new BoxDecoration(
                border: Border.all(width: 2.5, color: USER_COLOR),
                borderRadius: const BorderRadius.all(const Radius.circular(5))
              ),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Text(subjectName, style: new TextStyle(color: USER_COLOR, fontWeight: FontWeight.bold)),
                  new Text(location + " - " + shift, style: new TextStyle(color: USER_COLOR, fontWeight: FontWeight.bold))
                ],
              ),
            ),
            onTap: () async {
              final result = await fetchSubject(1);
              Navigator.push(context, MaterialPageRoute(builder: (context) => SubjectInfo(subject: result)));
            },
          ),
        ),
      ],
    );
  }

  Widget buildNewScheduleDay() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        child: new ListView(padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0), children: <Widget>[
          buildNewShift("08h00", "09h30", "Análise Matemática 1", "Ed.VII - Auditório 1A", "T1"),
          new Padding(padding: EdgeInsets.all(2.0)),
          buildNewShift("09h30", "11h00", "Programação de Microprocessadores", "Ed.Dep. - Sala 2.2", "T1"),
          new Padding(padding: EdgeInsets.all(2.0)),
          buildNewShift("11h00", "13h00", "Sistemas Lógicos 1", "Ed.X - Lab 2.1", "P2"),
          new Padding(padding: EdgeInsets.all(2.0)),
          buildNewShift("14h00", "17h00", "Programação de Microprocessadores", "Ed.X - Lab 1.2", "P2"),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: new Text(LocaleHolder.getValue(SCHEDULE)),
        backgroundColor: USER_COLOR,
      ),
      body: PageView.builder(
        controller: PageController(initialPage: DateTime.now().weekday + 49),
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
                      days[index % days.length],
                      style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: buildNewScheduleDay(),
              )
            ],
          );
        },
      ),
    );
  }
}
