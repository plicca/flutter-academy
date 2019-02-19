import 'package:clip/config/locales.dart';
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
      new Text(LocaleHolder.getValue(COURSE_GPA), style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
      new Text(average.toStringAsPrecision(3), style: new TextStyle(fontSize: 16.0))
    ];
  }

  List<Widget> renderProfileUser() {
    if(currentUser.startDate != null) {
      return [
        new Padding(padding: EdgeInsets.only(bottom: 5.0)),
        new Center(child: new Icon(Icons.person, size: 150.0)),
        new Padding(padding: EdgeInsets.only(bottom: 5.0)),
        new Text(LocaleHolder.getValue(FULL_NAME), style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
        new Text(currentUser.firstName + " " + currentUser.lastName, style: new TextStyle(fontSize: 16.0)),
        new Padding(padding: EdgeInsets.only(bottom: 5.0)),
        new Text(LocaleHolder.getValue(USER_NUMBER), style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
        new Text(currentUser.id.toString(), style: new TextStyle(fontSize: 16.0)),
        new Padding(padding: EdgeInsets.only(bottom: 5.0)),
        new Text(LocaleHolder.getValue(COURSE), style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
        new Text(currentUser.cursoID.toString(), style: new TextStyle(fontSize: 16.0)),
        new Padding(padding: EdgeInsets.only(bottom: 5.0)),
        new Text(LocaleHolder.getValue(START_DATE), style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
        new Text(formatDate(currentUser.startDate, dateFormat), style: new TextStyle(fontSize: 16.0)),
        new Padding(padding: EdgeInsets.only(bottom: 5.0)),
      ];
    } else return null;
  }

  List<Widget> displayProfile() {
    if(renderProfileUser() == null) {
      return [
        new Expanded(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              new CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(USER_COLOR),
              ),
            ] 
          ),
        )
      ];
    } else {
      if(IS_STUDENT) {
        return renderProfileUser() + averageGrade();
      } else {
        return renderProfileUser();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
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
        label: new Text(LocaleHolder.getValue(UPDATE)),
        icon: new Icon(Icons.update),
      )
    );
  }
}