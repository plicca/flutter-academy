import 'package:clip/model/grade.dart';
import 'package:flutter/material.dart';
import 'package:clip/model/student.dart';
import 'package:clip/networking/student_endpoint.dart';
import 'package:clip/networking/grade_endpoint.dart';
import 'package:clip/update_user_profile.dart';
import 'package:date_format/date_format.dart';

Student currentStudent = new Student(firstName: "", lastName: "");
List<Grade> studentGradesList = [];

class User extends StatefulWidget {
  UserState createState() => new UserState();
}

class UserState extends State<User> with SingleTickerProviderStateMixin {

  final dateFormat = [dd, '/', mm, '/', yyyy];

  void initState() {
    super.initState();
    fetchStudent(2).then((Student receivedStudent) {
      setState(() {
        currentStudent = receivedStudent;
      });
    });
    fetchGradesByStudent(2).then((List<Grade> receivedList) {
      setState(() {
        studentGradesList = receivedList;
      });
    });
  }

  double getAverageGrade() {
    double average = 0;

    for(int i = 0; i < studentGradesList.length; i++) {
      average += (studentGradesList[i].rank/studentGradesList.length);
    }
    return average;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                new Text(formatDate(currentStudent.startDate, dateFormat), style: new TextStyle(fontSize: 16.0)),
                new Padding(padding: EdgeInsets.only(bottom: 5.0)),
                new Text("Média de Curso: ", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                new Text(getAverageGrade().toStringAsPrecision(3), style: new TextStyle(fontSize: 16.0))
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProfile(student: currentStudent)));
          if(result != null){
            setState(() {
              currentStudent = result; 
            });
          }
        },
        backgroundColor: Colors.green,
        label: new Text("Update"),
        icon: new Icon(Icons.update),
      )
    );
  }
}