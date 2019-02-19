import 'package:clip/config/locales.dart';
import 'package:clip/config/variables.dart';
import 'package:clip/model/user.dart';
import 'package:clip/networking/teacher_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:clip/networking/student_endpoint.dart';

class UpdateProfile extends StatefulWidget {
  final User user;

  UpdateProfile({this.user}) : super();

  UpdateProfileState createState() => new UpdateProfileState(user);
}

class UpdateProfileState extends State<UpdateProfile> with SingleTickerProviderStateMixin {
  final User user;
  UpdateProfileState(this.user);

  final TextEditingController firstController = new TextEditingController();
  final TextEditingController lastController = new TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(LocaleHolder.getValue(UPDATE_PROFILE)),
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
                hintText: LocaleHolder.getValue(FIRST_NAME)+ user.firstName + "..."
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
                hintText: LocaleHolder.getValue(LAST_NAME) + user.lastName + "..."
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
        label: new Text(LocaleHolder.getValue(SAVE)),
        onPressed: () {
          setState(() async {
            if(firstController.text != "" && lastController.text != "") {
              user.firstName = firstController.text;
              user.lastName = lastController.text;
              final result = await (IS_STUDENT ?  updateStudent(user) : updateTeacher(user));
              Navigator.of(context).pop(result);
            } else {
              Navigator.of(context).pop(user);
            }
          });
        },
        backgroundColor: USER_COLOR,
        icon: new Icon(Icons.save),
      )
    );
  }
}