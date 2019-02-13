import 'package:flutter/material.dart';

class ScheduleDisplay extends StatefulWidget {
  @override
  ScheduleDisplayState createState() => new ScheduleDisplayState();
}

class ScheduleDisplayState extends State<ScheduleDisplay> with SingleTickerProviderStateMixin{
  TabController controller;
  ScrollController scroller;
  List<Widget> mondayShifts = [];
  List<Widget> tuesdayShifts = [];
  List<Widget> wednesdayShifts = [];
  List<Widget> thursdayShifts = [];
  List<Widget> fridayShifts = [];
  
  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 5);
    scroller = new ScrollController();
  }

  Widget buildNewShift(String startHour, endHour, subjectName, location, shift) {
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;
    return new Row(
      children: <Widget>[
        new Container(
          margin: EdgeInsets.only(right: w *0.01),
          padding: EdgeInsets.symmetric(horizontal: w * 0.02),
          height: h * 0.12,
          decoration: new BoxDecoration(
            color: Colors.green,
            border: Border.all(width: 2.5, color: Colors.green),
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
                border: Border.all(width: 2.5, color: Colors.green),
                borderRadius: const BorderRadius.all(const Radius.circular(5))
              ),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Text(subjectName, style: new TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
                  new Text(location + " - " + shift, style: new TextStyle(color: Colors.green, fontWeight: FontWeight.bold))
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ) 
        ),
      ],
    );
  }

  Widget buildNewScheduleDay(List<Widget> weekdayShifts){
    return new ListView(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      children: <Widget> [
        buildNewShift("08h00", "09h30", "Análise Matemática", "Ed.VII - Auditório 1A", "T1"),
        new Padding(padding: EdgeInsets.all(2.0)),
        buildNewShift("09h30", "11h00", "Programação de Microprocessadores", "Ed.Dep. - Sala 2.2", "T1"),
        new Padding(padding: EdgeInsets.all(2.0)),
        buildNewShift("11h00", "13h00", "Sistemas Lógicos 1", "Ed.X - Lab 2.1", "P2"),
        new Padding(padding: EdgeInsets.all(2.0)),
        buildNewShift("14h00", "17h00", "Programação de Microprocessadores", "Ed.X - Lab 1.2", "P2"),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Schedule"),
        backgroundColor: Colors.green,
        bottom: new TabBar(
          indicatorColor: Colors.white,
          isScrollable: true,
          controller: controller,
          tabs: <Widget>[
            new Tab(text: "Monday"),
            new Tab(text: "Tuesday"),
            new Tab(text: "Wednesday"),
            new Tab(text: "Thursday"),
            new Tab(text: "Friday")
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          buildNewScheduleDay(mondayShifts),
          buildNewScheduleDay(tuesdayShifts),
          buildNewScheduleDay(wednesdayShifts),
          buildNewScheduleDay(thursdayShifts),
          buildNewScheduleDay(fridayShifts)
        ],
      ),
    );
  }
}