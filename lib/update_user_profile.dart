import 'package:clip/config/variables.dart';
import 'package:flutter/material.dart';
import 'package:clip/model/student.dart';
import 'package:clip/networking/student_endpoint.dart';

class UpdateProfile extends StatefulWidget {

  final Student student;

  UpdateProfile({this.student}) : super();

  UpdateProfileState createState() => new UpdateProfileState(student);
}

class UpdateProfileState extends State<UpdateProfile> with SingleTickerProviderStateMixin {
  
  final Student student;
  UpdateProfileState(this.student);

  final TextEditingController firstController = new TextEditingController();
  final TextEditingController lastController = new TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Update User Profile"),
        backgroundColor: USER_COLOR,
        centerTitle: true,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(top:20.0, left: 50.0, right: 50.0),
              child: new TextField(
                decoration: new InputDecoration(
                hintText: "First name: " + student.firstName + "..."
              ),
                onSubmitted: (String str) {
                 firstController.text = str;
                },
                controller: firstController,
              ),
            ),
            new Padding(
              padding: EdgeInsets.only(top:20.0, left: 50.0, right: 50.0),
              child: new TextField(
                decoration: new InputDecoration(
                hintText: "Last name: " + student.lastName + "..."
                ),
                onSubmitted: (String str) {
                  lastController.text = str;
                },
                controller: lastController,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton.extended(
        label: new Text("Save"),
        onPressed: () {
          setState(() async {
            if(firstController.text != "" && lastController.text != "") {
              student.firstName = firstController.text;
              student.lastName = lastController.text;
              final updatedStudent = await updateStudent(student);
              Navigator.of(context).pop(updatedStudent);
            } else {
              Navigator.of(context).pop(student);
            }
          });
        },
        backgroundColor: USER_COLOR,
        icon: new Icon(Icons.save),
      )
    );
  }
}