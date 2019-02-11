import 'package:clip/model/student_subject_info.dart';
import 'package:clip/model/subject.dart';
import 'package:clip/networking/student_subject_endpoint.dart';
import 'package:flutter/material.dart';

class SubjectInfo extends StatefulWidget {
  final Subject subject;

  SubjectInfo({this.subject}) : super();

  _SubjectInfoState createState() => new _SubjectInfoState(subject);
}

class _SubjectInfoState extends State<SubjectInfo> {
  final Subject subject;
  List<StudentSubjectsInfo> _enrolled = [];

  _SubjectInfoState(this.subject);

  void initState() {
    super.initState();
    fetchSubjectStudents(subject.id).then((List<StudentSubjectsInfo> x) {
      setState(() {
        _enrolled = x;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject.name),
        backgroundColor: Colors.green,
      ),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(subject.description, style: TextStyle(fontSize: 20.0)),
              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                height: 2.0,
                color: Colors.green,
              ),
              Center(
                child: Text("Lista de inscritos", textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0)),
              ),
              Expanded(
                child: _buildEnrolledStudents(),
              ),
            ],
          )),
    );
  }

  Widget _buildEnrolledStudents() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          final index = i;
          if (i >= _enrolled.length) return null;
          return _buildRow(_enrolled[index]);
        });
  }

  Widget _buildRow(StudentSubjectsInfo enrolled) {
    return ListTile(
        title: Text(enrolled.studentID.toString() + ": " + enrolled.studentFirstName + " " + enrolled.studentLastName),
        onTap: () {
          debugPrint(enrolled.studentFirstName);
        });
  }
}
