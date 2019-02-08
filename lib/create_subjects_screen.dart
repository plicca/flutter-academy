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
        backgroundColor: Colors.green,
        title: Text("Create Subject"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
              child: new Column(
                children: <Widget>[
                  new Text(
                    "Subject Name:",
                    style: new TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0
                    )
                  ),
                  new TextField(
                    decoration: new InputDecoration(
                    hintText: "Ex.: Eletrónica 1"
                  ),
                    onSubmitted: (String str) {
                      controllerName.text = str;
                    },
                    controller: controllerName,
                  ),                
                ],
              )
            ),
            new Padding(
              padding: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
              child: new Column(
                children: <Widget>[
                  new Text(
                    "Subject's Description:",
                    style: new TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0
                    )
                  ),
                  new TextField(
                    decoration: new InputDecoration(
                    hintText: "Ex.: It's very"
                  ),
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
        label: new Text("Create"),
        onPressed: () {
          setState(() async {
            final subject = await createSubject(controllerName.text, controllerDescription.text);
            createProfessorSubject(2, subject.id).then((ProfessorSubject x) => Navigator.of(context).pop(subject)); 
          });
        },
        backgroundColor: Colors.green,
        icon: new Icon(Icons.create_new_folder),
      ),
    );
  }
}
