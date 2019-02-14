import 'package:clip/config/variables.dart';
import 'package:clip/model/grade.dart';
import 'package:flutter/material.dart';
import 'package:clip/model/user.dart';
import 'package:clip/networking/student_endpoint.dart';
import 'package:clip/networking/teacher_endpoint.dart';
import 'package:clip/networking/grade_endpoint.dart';
import 'package:clip/update_user_profile.dart';
import 'package:date_format/date_format.dart';

User currentUser = new User(firstName: "", lastName: "");
List<Grade> studentGradesList = [];

class UserProfile extends StatefulWidget {
  UserProfileState createState() => new UserProfileState();
}

class UserProfileState extends State<UserProfile> with SingleTickerProviderStateMixin {

  final dateFormat = [dd, '/', mm, '/', yyyy];

  void initState() {
    super.initState();
    if(IS_STUDENT){
      fetchStudent(USER_STUDENT.id).then((User receivedStudent) {
        setState(() {
          currentUser = receivedStudent;
        });
      });
      fetchGradesByStudent(USER_STUDENT.id).then((List<Grade> receivedList) {
        setState(() {
          studentGradesList = receivedList;
        });
      });
    } else {
      fetchTeacher(USER_TEACHER.id).then((User receivedTeacher) {
        setState(() {
         currentUser = receivedTeacher; 
        });
      });
    }
  }

  List<Widget> averageGrade() {
    double average = 0;

    for(int i = 0; i < studentGradesList.length; i++) {
      average += (double.parse(studentGradesList[i].rank)/studentGradesList.length);
    }

    return [
      new Text("Média de Curso: ", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
      new Text(average.toStringAsPrecision(3), style: new TextStyle(fontSize: 16.0))
    ];
  }

  List<Widget> renderProfileUser() {
    return [
      new Text("Nome Completo: ", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
      new Text(currentUser.firstName + " " + currentUser.lastName, style: new TextStyle(fontSize: 16.0)),
      new Padding(padding: EdgeInsets.only(bottom: 5.0)),
      new Text("Número de Professor: ", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
      new Text(currentUser.id.toString(), style: new TextStyle(fontSize: 16.0)),
      new Padding(padding: EdgeInsets.only(bottom: 5.0)),
      new Text("Curso: ", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
      new Text(currentUser.cursoID.toString(), style: new TextStyle(fontSize: 16.0)),
      new Padding(padding: EdgeInsets.only(bottom: 5.0)),
      new Text("Data de início: ", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
      new Text(formatDate(currentUser.startDate, dateFormat), style: new TextStyle(fontSize: 16.0)),
      new Padding(padding: EdgeInsets.only(bottom: 5.0)),
    ];
  }

  List<Widget> displayProfile() {
    if(IS_STUDENT) {
      return renderProfileUser() + averageGrade();
    } else {
      return renderProfileUser();
    }
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
              children: displayProfile()
            ),
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton.extended(
        onPressed: () async {
          final User result = await Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProfile(user: currentUser)));
          if(result != null){
            setState(() {
              currentUser = result; 
            });
          }
        },
        backgroundColor: USER_COLOR,
        label: new Text("Update"),
        icon: new Icon(Icons.update),
      )
    );
  }
}