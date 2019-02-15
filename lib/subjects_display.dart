import 'package:clip/config/variables.dart';
import 'package:clip/model/student_subject_info.dart';
import 'package:clip/model/subject.dart';
import 'package:clip/networking/student_subject_endpoint.dart';
import 'package:clip/networking/subject_endpoint.dart';
import 'package:clip/subject_info.dart';
import 'package:flutter/material.dart';
import 'package:clip/create_subjects_screen.dart';

class Subjects extends StatefulWidget {
  @override
  _SubjectsState createState() => new _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  List<Subject> _subjects = [];
  int _selected = 0;

  List<StudentSubjectsInfo> _list2016;
  List<StudentSubjectsInfo> _list2017;
  List<StudentSubjectsInfo> _list2018;

  List<Subject> _listProf2016;
  List<Subject> _listProf2017;
  List<Subject> _listProf2018;


  void onChanged(int v) {
    setState(() {
      _selected = v;
    });
  }

  void initState() {
    super.initState();
    if(IS_STUDENT){
      fetchSubjectsByStudentIDAndSchoolYear(USER_STUDENT.id, "2016/2017").then((List<StudentSubjectsInfo> List2016) {
        setState(() {
          _list2016 = List2016;
        });
      });
      fetchSubjectsByStudentIDAndSchoolYear(USER_STUDENT.id, "2017/2018").then((List<StudentSubjectsInfo> List2017) {
        setState(() {
          _list2016 = List2017;
        });
      });
      fetchSubjectsByStudentIDAndSchoolYear(USER_STUDENT.id, "2018/2019").then((List<StudentSubjectsInfo> List2018) {
        setState(() {
          _list2016 = List2018;
        });
      });
      fetchSubjectsByStudentID(USER_STUDENT.id).then((List<Subject> subjectsList) {
        setState(() {
          _subjects = subjectsList;
        });
      });
    } else {
      fetchSubjectsByProfessorID(USER_TEACHER.id).then((List<Subject> subjectsList) {
        setState(() {
          _subjects = subjectsList;
        });
      });
    }
  }

  Widget createSubjectsButton() {
    if(!IS_STUDENT){
      return new FloatingActionButton(
        onPressed: () async {
          final Subject result = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateSubjectScreen()));
          if (result != null) {
            setState(() {
              _subjects.add(result);
            });
          }
        },
        child: Icon(Icons.add),
        backgroundColor: USER_COLOR,
      );
    } else {
      return null;
    }
  }

  Future<Null> refreshPage() async {
    if(IS_STUDENT){
      fetchSubjectsByStudentID(USER_STUDENT.id).then((List<Subject> subjectsList) {
        setState(() {
          _subjects = subjectsList;
        });
      });
    } else {
      fetchSubjectsByProfessorID(USER_TEACHER.id).then((List<Subject> subjectsList) {
        setState(() {
          _subjects = subjectsList;
        });
      });
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Column(
        children: <Widget>[
          new Center(
              child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Search Option:",
                  style: new TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.bold)),
              new Padding(
                padding: new EdgeInsets.only(left: 10.0),
              ),
              new DropdownButton(
                value: _selected,
                items: [
                  new DropdownMenuItem(
                    child: new Text("2016/2017"),
                    value: 0,
                  ),
                  new DropdownMenuItem(
                    child: new Text("2017/2018"),
                    value: 1,
                  ),
                  new DropdownMenuItem(
                    child: new Text("2018/2019"),
                    value: 2,
                  )
                ],
                onChanged: onChanged,
              ),
            ],
          )),
          new Container(
            child: Expanded(
              child: RefreshIndicator(
                child: _buildSubjects(),
                onRefresh: refreshPage,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: createSubjectsButton()
    );
  }

  Widget _buildSubjects() {
    int itemCount = 0;
    switch(_selected) {
      case 0: itemCount = _list2016.length; break;
      case 1: itemCount = _list2017.length; break;
      case 2: itemCount = _list2018.length; break;
    }
    return ListView.builder(
      itemCount: itemCount,
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
//        final index = i;
//        if (i >= _subjects.length) return null;
        return _buildRow(i);
      });
  }

  Widget _buildRow(int i) {
//    String name;
//    switch (_selected) {
//
//    }
    return ListTile(
      title: Text("(" + subject.id.toString() + ") " + subject.name),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SubjectInfo(subject: subject)));
      },
    );
  }z
}
