import 'package:flutter/material.dart';
import 'package:clip/model/professor.dart';
import 'package:clip/networking/teacher_endpoint.dart';

class User extends StatefulWidget {
  UserState createState() => new UserState();
}

class UserState extends State<User> with SingleTickerProviderStateMixin {

  Professor currentProfessor =  Professor(id: 0, firstName: "", lastName: "",
      cursoID: 0, startDate: "");

  @override
  void initState() {
    super.initState();
    fetchProfessorbyID(1).then((Professor x) {
      setState(() {
        currentProfessor = x;
      });
    });
  }

  void onPressed() {

  }

  @override
  Widget build(BuildContext context) {
    return new Column(
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
              new Text(currentProfessor.firstName + " " + currentProfessor.lastName),
              new Padding(padding: EdgeInsets.only(bottom: 5.0)),
              new Text("Número de Professor: ", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
              new Text(currentProfessor.id.toString()),
              new Padding(padding: EdgeInsets.only(bottom: 5.0)),
              new Text("Curso: ", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
              new Text(currentProfessor.cursoID.toString()),
              new Padding(padding: EdgeInsets.only(bottom: 5.0)),
              new Text("Data de início: ", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
              new Text(currentProfessor.startDate),
              new Padding(padding: EdgeInsets.only(bottom: 5.0)),
            ],
          ),
        ),
        new Container(
          padding: EdgeInsets.only(top: 25.0),
          child: new Center(
            child: new RaisedButton(
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              child: new Text("Update", style: new TextStyle(color: Colors.white)),
              color: Colors.green,
              onPressed: onPressed,
            ),
          ),
        )
      ],
    );
  }
}