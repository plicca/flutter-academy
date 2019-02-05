import 'package:flutter/material.dart';
import 'package:clip/model/student.dart';
import 'package:clip/networking/student_endpoint.dart';
import 'package:clip/update_user_profile.dart';

Student currentStudent = new Student(firstName: "", lastName: "");

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