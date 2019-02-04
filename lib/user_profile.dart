import 'package:flutter/material.dart';
import 'package:clip/model/student.dart';
import 'package:clip/networking/student_endpoint.dart';

Student currentStudent = new Student();

class User extends StatefulWidget {
  UserState createState() => new UserState();
}

class UserState extends State<User> with SingleTickerProviderStateMixin {

  void initState() {
    super.initState();
    fetchStudent(5).then((Student receivedStudent) {
      setState(() {
        currentStudent = receivedStudent;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Profile"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            child: new Icon(Icons.person, size: 150.0),
            padding: EdgeInsets.only(bottom: 15.0, top: 10.0),
          ),
          new Container(
            padding: EdgeInsets.only(left: 10.0),
            alignment: Alignment.centerLeft,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text("Nome Completo: ", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                new Text(currentStudent.firstName + " " + currentStudent.lastName, style: new TextStyle(fontSize: 16.0)),
                new Padding(padding: EdgeInsets.only(bottom: 5.0)),
                new Text("Número de Aluno: ", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                new Text(currentStudent.id.toString(), style: new TextStyle(fontSize: 16.0)),
                new Padding(padding: EdgeInsets.only(bottom: 5.0)),
                new Text("Curso: ", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                new Text(currentStudent.cursoID.toString(), style: new TextStyle(fontSize: 16.0)),
                new Padding(padding: EdgeInsets.only(bottom: 5.0)),
                new Text("Data de início: ", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                new Text(currentStudent.startDate, style: new TextStyle(fontSize: 16.0)),
                new Padding(padding: EdgeInsets.only(bottom: 5.0)),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProfile()));
        },
        backgroundColor: Colors.green,
        label: new Text("Update"),
        icon: new Icon(Icons.update),
      )
    );
  }
}

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
          Navigator.pop(context);
          setState(() {
            currentStudent.firstName = firstController.text;
            currentStudent.lastName = lastController.text;
          });
        },
        backgroundColor: Colors.green,
        icon: new Icon(Icons.save),
      )
    );
  }
}