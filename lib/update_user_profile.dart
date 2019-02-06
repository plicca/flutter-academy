import 'package:flutter/material.dart';
import './user_profile.dart' as user;
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
        backgroundColor: Colors.green,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(top:20.0, left: 50.0, right: 50.0),
              child: new TextField(
                decoration: new InputDecoration(
                hintText: student.firstName + "..."
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
                hintText: student.lastName + "..."
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
          setState(() {
            student.firstName = firstController.text;
            student.lastName = lastController.text;
            updateStudent(student).then((Student x) => Navigator.pop(context));
          });
        },
        backgroundColor: Colors.green,
        icon: new Icon(Icons.save),
      )
    );
  }
}