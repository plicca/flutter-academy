import 'package:clip/config/locales.dart';
import 'package:clip/config/variables.dart';
import 'package:clip/give_grade_to_student.dart';
import 'package:clip/model/student_subject_info.dart';
import 'package:clip/model/subject.dart';
import 'package:clip/networking/student_subject_endpoint.dart';
import 'package:flutter/material.dart';

class SubjectInfo extends StatefulWidget {
  final Subject subject;
  final bool isNotSearchPage;

  SubjectInfo({this.subject, this.isNotSearchPage}) : super();

  _SubjectInfoState createState() => new _SubjectInfoState(subject, isNotSearchPage);
}

class _SubjectInfoState extends State<SubjectInfo> {
  final Subject subject;
  final isNotSearchPage;
  List<StudentSubjectsInfo> _enrolled = [];

  _SubjectInfoState(this.subject, this.isNotSearchPage);

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
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(subject.name.toString()),
        backgroundColor: USER_COLOR,
      ),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(subject.description.toString(), style: TextStyle(fontSize: 20.0)),
              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                height: 2.0,
                color: USER_COLOR,
              ),
              Center(
                child: Text(LocaleHolder.getValue(ENROLLED_STUDENTS), textAlign: TextAlign.center, style: TextStyle(fontSize: 20.0)),
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
          if(!IS_STUDENT && isNotSearchPage){
            Navigator.push(context, MaterialPageRoute(builder: (context) => GiveGradeToStudent(subjectID: enrolled.subjectID, studentID: enrolled.studentID)));
          }
        });
  }
}
