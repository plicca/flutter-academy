import 'package:clip/config/locales.dart';
import 'package:clip/config/variables.dart';
import 'package:flutter/material.dart';
import 'package:clip/networking/subject_endpoint.dart';
import 'package:clip/networking/teacher_subject_endpoint.dart';

class CreateSubjectScreen extends StatefulWidget {
  _CreateSubjectScreenState createState() => new _CreateSubjectScreenState();
}

class _CreateSubjectScreenState extends State<CreateSubjectScreen> {
  final TextEditingController controllerName = new TextEditingController();
  final TextEditingController controllerDescription = new TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: USER_COLOR,
        title: Text(LocaleHolder.getValue(CREATE_SUBJECTS)),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            new Padding(
                padding: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
                child: new Column(
                  children: <Widget>[
                    new Text(LocaleHolder.getValue(SUBJECT_NAME), style: new TextStyle(color: USER_COLOR, fontWeight: FontWeight.bold, fontSize: 16.0)),
                    new TextField(
                      decoration: new InputDecoration(hintText: LocaleHolder.getValue(EXAMPLE_NAME)),
                      onSubmitted: (String str) {
                        controllerName.text = str;
                      },
                      controller: controllerName,
                    ),
                  ],
                )),
            new Padding(
              padding: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
              child: new Column(
                children: <Widget>[
                  new Text(LocaleHolder.getValue(SUBJECT_DESCRIPTION), style: new TextStyle(color: USER_COLOR, fontWeight: FontWeight.bold, fontSize: 16.0)),
                  new TextField(
                    decoration: new InputDecoration(hintText: LocaleHolder.getValue(EXAMPLE_DESCRIPTION)),
                    onSubmitted: (String str) {
                      controllerDescription.text = str;
                    },
                    controller: controllerDescription,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton.extended(
        label: new Text(LocaleHolder.getValue(CREATE)),
        onPressed: () {
          if (controllerName.text == "") {
            ErrNoNameSubject(context);
          } else {
            setState(() async {
              final subject = await createSubject(controllerName.text, controllerDescription.text);
              if (subject != null) {
                await createProfessorSubject(USER_TEACHER.id, subject.id);
                Navigator.of(context).pop(subject);
              } else {
                ErrDuplicateSubject(context);
              }
            });
          }
        },
        backgroundColor: USER_COLOR,
        icon: new Icon(Icons.create_new_folder),
      ),
    );
  }

  Future<bool> ErrNoNameSubject(BuildContext context) {
    return showDialog<bool>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(LocaleHolder.getValue(ALERT_EMPTY_NAME)),
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

  Future<bool> ErrDuplicateSubject(BuildContext context) {
    return showDialog<bool>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(LocaleHolder.getValue(ALERT_REPEATED_NAME)),
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
