import 'package:clip/grade_endpoint.dart';
import 'package:flutter/material.dart';

class GiveGradeToStudent extends StatefulWidget {
  int subjectID;
  int studentID;
  GiveGradeToStudent ({this.subjectID, this.studentID});

  _GiveGradeToStudent createState() => new _GiveGradeToStudent(subjectID: subjectID, studentID: studentID);
}

class _GiveGradeToStudent extends State<GiveGradeToStudent> {
  int subjectID;
  int studentID;
  _GiveGradeToStudent ({this.subjectID, this.studentID});
  TextEditingController gradeController = new TextEditingController();

  Widget build (BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text("Give grade"),
        backgroundColor: Colors.green,
      ),
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          TextFormField (
            controller: gradeController,
          ),
          RaisedButton (
            onPressed: () {
              print(gradeController.text);
              updateGrade(subjectID, studentID, gradeController.text.toString());
            },
          ),
        ],
      ),
    );
  }

}