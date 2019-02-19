import 'package:clip/config/variables.dart';
import 'package:clip/model/teacher_subject.dart';
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
        title: Text("Criar Disciplina"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            new Padding(
                padding: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
                child: new Column(
                  children: <Widget>[
                    new Text("Nome:", style: new TextStyle(color: USER_COLOR, fontWeight: FontWeight.bold, fontSize: 16.0)),
                    new TextField(
                      decoration: new InputDecoration(hintText: "Ex.: Eletrónica 1"),
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
                  new Text("Descrição:", style: new TextStyle(color: USER_COLOR, fontWeight: FontWeight.bold, fontSize: 16.0)),
                  new TextField(
                    decoration: new InputDecoration(hintText: "Temas abordados"),
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
        label: new Text("Criar"),
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
            title: Text('Não é possível criar uma cadeira sem nome.'),
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
            title: Text('Já existe uma cadeira com esse nome.'),
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
