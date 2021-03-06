import 'package:clip/config/locales.dart';
import 'package:clip/config/variables.dart';
import 'package:clip/networking/grade_endpoint.dart';
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
        centerTitle: true,
        backgroundColor: USER_COLOR,
        title: Text(LocaleHolder.getValue(EVALUATION)),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            new Padding(
                padding: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
                child: new Column(
                  children: <Widget>[
                    new Text(LocaleHolder.getValue(EVALUATION) + ": ", style: new TextStyle(color: USER_COLOR, fontWeight: FontWeight.bold, fontSize: 16.0),),
                    new TextField(
                      decoration: new InputDecoration(hintText: LocaleHolder.getValue(EVALUATION_EXAMPLE)),
                      onSubmitted: (String str) {
                        gradeController.text = str;
                      },
                      controller: gradeController,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton.extended(
          backgroundColor: USER_COLOR,
          onPressed: () {
            if (gradeController.text == "") {
              ErrNoGrade(context);
            } else {
              setState(() async {
                updateGrade(subjectID, studentID, gradeController.text.toString());
              });
            }
          },
          icon: new Icon(Icons.add_circle),
          label: new Text(LocaleHolder.getValue(ASSIGN)),
        ),
      );
  }

  Future<bool> ErrNoGrade(BuildContext context) {
    return showDialog<bool>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(LocaleHolder.getValue(ALERT_EMPTY_GRADE)),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ],
          );
        });
  }
  }

