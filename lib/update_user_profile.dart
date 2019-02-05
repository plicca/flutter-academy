import 'package:flutter/material.dart';
import './user_profile.dart' as user;
import 'package:clip/model/student.dart';
import 'package:clip/networking/student_endpoint.dart';

class UpdateProfile extends StatefulWidget {
  UpdateProfileState createState() => new UpdateProfileState();
}

class UpdateProfileState extends State<UpdateProfile> with SingleTickerProviderStateMixin {
  
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
                hintText: "First name..."
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
                hintText: "Last name..."
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
            user.currentStudent.firstName = firstController.text;
            user.currentStudent.lastName = lastController.text;
            updateStudent(user.currentStudent).then((Student x) => Navigator.pop(context));
          });
        },
        backgroundColor: Colors.green,
        icon: new Icon(Icons.save),
      )
    );
  }
}