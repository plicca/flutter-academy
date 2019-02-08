import 'package:clip/model/subject.dart';
import 'package:flutter/material.dart';

class SubjectInfo extends StatefulWidget {
  final Subject subject;

  SubjectInfo({this.subject}) : super();

  _SubjectInfoState createState() => new _SubjectInfoState(subject);
}

class _SubjectInfoState extends State<SubjectInfo> {
  final Subject subject;

  _SubjectInfoState(this.subject);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject.name),
        backgroundColor: Colors.green,
      ),
      body: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
            child: Text(subject.description, style: TextStyle(fontSize: 20.0)),
          ),
          Container(
            height: 2.0,
            color: Colors.green,
          )
        ],
      )),
    );
  }
}
