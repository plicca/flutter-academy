import 'package:clip/config/variables.dart';
import 'package:clip/model/professor.dart';
import 'package:clip/model/student.dart';
import 'package:clip/model/student_subject.dart';
import 'package:clip/model/subject.dart';
import 'package:clip/model/teacher_subject.dart';
import 'package:clip/model/teacher_subject_info.dart';
import 'package:clip/model/user.dart';
import 'package:clip/networking/student_endpoint.dart';
import 'package:clip/networking/student_subject_endpoint.dart';
import 'package:clip/networking/subject_endpoint.dart';
import 'package:clip/networking/teacher_endpoint.dart';
import 'package:clip/subject_info.dart';
import 'package:flutter/material.dart';
import 'package:clip/create_subjects_screen.dart';
import 'package:clip/model/student_grade.dart';
import 'package:clip/networking/student_grade_endpoint.dart';
import 'package:clip/networking/teacher_subject_endpoint.dart';


class YearValue {
  final int dateYear;
  final int buttonValue;

  YearValue ({this.dateYear, this.buttonValue});
}

class Subjects extends StatefulWidget {
  @override
  _SubjectsState createState() => new _SubjectsState();
}

class _SubjectsState extends State<Subjects> {

  int _selected = 0;
  List<YearValue> values = [];

  List<StudentGrade> _studentGrade = [];
  List<StudentGrade> processedStudentGrade = [];

  List<TeacherSubjectInfo> _teacherSubjects = [];
  List<TeacherSubjectInfo> processedTeacherSubjects = [];

  //MUDAR SUBJECTINFO para receber um id em vez de um subject
  //adicioionar description no teacher subject info e na backend
  //fazer merge do fix de bugs

  void onChanged(int v) {
    setState(() {
      _selected = v;
    });
    filterSubjects();
  }

  void initState() {
    super.initState();
    if(IS_STUDENT){
      fetchStudentGrade(USER_STUDENT.id).then((List<StudentGrade> subjectsInfo){
        setState(() {
          _studentGrade = subjectsInfo;
        });
      });
    } else {
      fetchSubjectsByTeacherID (USER_TEACHER.id).then((List<TeacherSubjectInfo> subjects){
        _teacherSubjects = subjects;
      });
    }
  }

  Future<Null> refreshPage() async {
    if(IS_STUDENT){
      fetchStudentGrade(USER_STUDENT.id).then((List<StudentGrade> subjectsInfo){
        setState(() {
          _studentGrade = subjectsInfo;
        });
      });
    } else {
      fetchSubjectsByTeacherID (USER_TEACHER.id).then((List<TeacherSubjectInfo> subjects){
        _teacherSubjects = subjects;
      });
    }
    return null;
  }

  Widget createSubjectsButton() {
    if(!IS_STUDENT){
      return new FloatingActionButton(
        onPressed: () async {
          final Subject result = await Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateSubjectScreen()));
//          if (result != null) {
//            setState(() {
//              _teacherSubjects.add(result);
//            });
//          }
        },
        child: Icon(Icons.add),
        backgroundColor: USER_COLOR,
      );
    } else {
      return null;
    }
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
                items: SchoolYears(SubjectIterator()),
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
    if (IS_STUDENT) {
      itemCount = processedStudentGrade.length;
    } else {
      //todo:add teacher
      itemCount = processedTeacherSubjects.length;
    }
    return ListView.builder(
      itemCount: itemCount,
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        return _buildRow(i);
      });
  }

  Widget _buildRow(int i) {
    String title, subtitle;
    if(IS_STUDENT) {
      title = "(" + processedStudentGrade[i].subjectID.toString() + ") " + processedStudentGrade[i].subjectName;
      subtitle = "Avalicação: " + processedStudentGrade[i].rank;
    } else {
      //todo: add teacher
      title = "(" + processedTeacherSubjects[i].subjectID.toString() + ") " + processedTeacherSubjects[i].subjectName;
      subtitle = "";
    }
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        if (!IS_STUDENT) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SubjectInfo(subject: subject)))
        }
      },
    );
  }

  List<DropdownMenuItem<int>> SchoolYears (List<String> schoolYears) {
    List<DropdownMenuItem<int>> textWidgets = new List<DropdownMenuItem<int>>();
    for (int i = 0; i < schoolYears.length; i++) {
       textWidgets.add(
           DropdownMenuItem(
             child: Text(schoolYears.elementAt(i)),
             value: i,
           )
       );
    }
    return textWidgets;
  }

  List<String> SubjectIterator () {
    List<int> temp = new List<int>();
    List<String> schoolYears = new List<String>();

    if(IS_STUDENT) {
      temp.add(_studentGrade.elementAt(0).date.year);
      for (int i = 1; i < _studentGrade.length; i++) {
        var year = _studentGrade.elementAt(i).date.year;
        if (_studentGrade.elementAt(i).date.isBefore(DateTime.parse(year.toString() + "-08-31 00:00:00"))) {
          year -= 1;
        }
        if (!temp.contains(year)) {
          temp.add(year);
        }
      }
      for (int i = 0; i < temp.length; i++) {
        String year = temp.elementAt(i).toString() + "/" + (temp.elementAt(i) + 1).toString();
        schoolYears.add(year);
        values.add(YearValue(dateYear: temp.elementAt(i), buttonValue: i));
      }
    } else {
      //todo: add teacher
      temp.add(_teacherSubjects.elementAt(0).date.year);
      for (int i = 1; i < _teacherSubjects.length; i++) {
        var year = _teacherSubjects.elementAt(i).date.year;
        if (_teacherSubjects.elementAt(i).date.isBefore(DateTime.parse(year.toString() + "-08-31 00:00:00"))) {
          year -= 1;
        }
        if (!temp.contains(year)) {
          temp.add(year);
        }
      }
      for (int i = 0; i < temp.length; i++) {
        String year = temp.elementAt(i).toString() + "/" + (temp.elementAt(i) + 1).toString();
        schoolYears.add(year);
        values.add(YearValue(dateYear: temp.elementAt(i), buttonValue: i));
      }
    }
    return schoolYears;
  }

  void filterSubjects() {
    if(IS_STUDENT) {
      for (int i = 0; i < values.length; i++) {
        var dateString = values.elementAt(i).dateYear.toString() + "-09-01 00:00:00";
        var nextDate = values.elementAt(i).dateYear + 1;
        var nextDateString = nextDate.toString() + "-08-31 00:00:00";
        if (_selected == values
            .elementAt(i)
            .buttonValue) {
          processedStudentGrade = _studentGrade.where((StudentGrade s) =>
          s.date.isAfter(DateTime.parse(dateString)) &&
              s.date.isBefore(DateTime.parse(nextDateString))
          ).toList();
        }
      }
    } else {
      //TODO: add teacher
      for (int i = 0; i < values.length; i++) {
        var dateString = values.elementAt(i).dateYear.toString() + "-09-01 00:00:00";
        var nextDate = values.elementAt(i).dateYear + 1;
        var nextDateString = nextDate.toString() + "-08-31 00:00:00";
        if (_selected == values.elementAt(i).buttonValue) {
          processedTeacherSubjects = _teacherSubjects.where((TeacherSubjectInfo s) =>
          s.date.isAfter(DateTime.parse(dateString)) &&
              s.date.isBefore(DateTime.parse(nextDateString))
          ).toList();
        }
      }
    }
  }
}