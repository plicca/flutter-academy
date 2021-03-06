import 'package:clip/config/locales.dart';
import 'package:clip/config/variables.dart';
import 'package:clip/model/subject.dart';
import 'package:clip/model/teacher_subject_info.dart';
import 'package:clip/subject_info.dart';
import 'package:flutter/material.dart';
import 'package:clip/create_subjects_screen.dart';
import 'package:clip/model/student_grade.dart';
import 'package:clip/networking/student_grade_endpoint.dart';
import 'package:clip/networking/teacher_subject_endpoint.dart';

class YearValue {
  final int dateYear;
  final int buttonValue;

  YearValue({this.dateYear, this.buttonValue});
}

class Subjects extends StatefulWidget {
  @override
  _SubjectsState createState() => new _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  
  bool isLoading = true;
  int _selected = 0;
  List<YearValue> values = [];

  List<StudentGrade> _studentGrade = [];
  List<StudentGrade> processedStudentGrade = [];

  List<TeacherSubjectInfo> _teacherSubjects = [];
  List<TeacherSubjectInfo> processedTeacherSubjects = [];

  void onChanged(int v) {
    setState(() {
      _selected = v;
    });
  }

  void initState() {
    super.initState();
    initializeFetch();
  }

  void initializeFetch() async {
    if (IS_STUDENT) {
      fetchStudentGrade(USER_STUDENT.id)
          .then((List<StudentGrade> subjectsInfo) {
        setState(() {
          _studentGrade = subjectsInfo;
          isLoading = false;
        });
      });
    } else {
      fetchSubjectsByTeacherID(USER_TEACHER.id)
          .then((List<TeacherSubjectInfo> subjects) {
        setState((){
          _teacherSubjects = subjects;
          isLoading = false;
      });
    });
    }
  }

  Future<Null> refreshPage() async {
    if (IS_STUDENT) {
      fetchStudentGrade(USER_STUDENT.id)
          .then((List<StudentGrade> subjectsInfo) {
        setState(() {
          _studentGrade = subjectsInfo;
        });
      });
    } else {
      fetchSubjectsByTeacherID(USER_TEACHER.id)
          .then((List<TeacherSubjectInfo> subjects) {
        _teacherSubjects = subjects;
      });
    }
    filterSubjects();
    return null;
  }

  Widget createSubjectsButton() {
    if (!IS_STUDENT) {
      return new FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateSubjectScreen()));
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
    if (isLoading == true) {
      return Scaffold(
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(USER_COLOR),
              ),
            ],
          ),
        ) 
      );
    } else {
      return Scaffold(
        body: new Column(
          children: <Widget>[
            new Center(
                child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(LocaleHolder.getValue(SEARCH_OPTION),
                    style: new TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold)),
                new Padding(
                  padding: new EdgeInsets.only(left: 10.0),
                ),
                new DropdownButton(
                  value: _selected,
                  items: schoolYears(subjectIterator()),
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
  }

  Widget _buildSubjects() {
    int itemCount = 0;
    filterSubjects();
    if (IS_STUDENT) {
      itemCount = processedStudentGrade.length;
    } else {
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
    if (IS_STUDENT) {
      title = "(" +
          processedStudentGrade[i].subjectID.toString() +
          ") " +
          processedStudentGrade[i].subjectName;
      subtitle = LocaleHolder.getValue(EVALUATION) + ": " + processedStudentGrade[i].rank;
    } else {
      title = "(" +
          processedTeacherSubjects[i].subjectID.toString() +
          ") " +
          processedTeacherSubjects[i].subjectName;
      subtitle = "";
    }
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: () {
        Subject subject;
        if(!IS_STUDENT) {
          subject = new Subject(
            id: processedTeacherSubjects[i].subjectID,
            name: processedTeacherSubjects[i].subjectName,
            description: processedTeacherSubjects[i].subjectDescription,
          );
        } else {
          subject = new Subject(
            id: processedStudentGrade[i].subjectID,
            name: processedStudentGrade[i].subjectName,
            description: processedStudentGrade[i].subjectDescription,
          );
        }
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SubjectInfo(subject: subject, isNotSearchPage: true)));
      },
    );
  }

  List<DropdownMenuItem<int>> schoolYears(List<String> schoolYears) {
    List<DropdownMenuItem<int>> textWidgets = new List<DropdownMenuItem<int>>();
    for (int i = 0; i < schoolYears.length; i++) {
      textWidgets.add(DropdownMenuItem(
        child: Text(schoolYears.elementAt(i)),
        value: i,
      ));
    }
    return textWidgets;
  }

  List<String> subjectIterator() {
    List<int> temp = new List<int>();
    List<String> schoolYears = new List<String>();

    if (IS_STUDENT) {
      temp.add(_studentGrade.elementAt(0).date.year);
      for (int i = 1; i < _studentGrade.length; i++) {
        var year = _studentGrade.elementAt(i).date.year;
        if (_studentGrade
            .elementAt(i)
            .date
            .isBefore(DateTime.parse(year.toString() + "-08-31 00:00:00"))) {
          year -= 1;
        }
        if (!temp.contains(year)) {
          temp.add(year);
        }
      }
      for (int i = 0; i < temp.length; i++) {
        String year = temp.elementAt(i).toString() +
            "/" +
            (temp.elementAt(i) + 1).toString();
        schoolYears.add(year);
        values.add(YearValue(dateYear: temp.elementAt(i), buttonValue: i));
      }
    } else {
      temp.add(_teacherSubjects.elementAt(0).date.year);
      for (int i = 1; i < _teacherSubjects.length; i++) {
        var year = _teacherSubjects.elementAt(i).date.year;
        if (_teacherSubjects
            .elementAt(i)
            .date
            .isBefore(DateTime.parse(year.toString() + "-08-31 00:00:00"))) {
          year -= 1;
        }
        if (!temp.contains(year)) {
          temp.add(year);
        }
      }
      for (int i = 0; i < temp.length; i++) {
        String year = temp.elementAt(i).toString() +
            "/" +
            (temp.elementAt(i) + 1).toString();
        schoolYears.add(year);
        values.add(YearValue(dateYear: temp.elementAt(i), buttonValue: i));
      }
    }
    schoolYears.sort();
    return schoolYears;
  }

  void filterSubjects() {
    if (IS_STUDENT) {
      for (int i = 0; i < values.length; i++) {
        var dateString =
            values.elementAt(i).dateYear.toString() + "-09-01 00:00:00";
        var nextDate = values.elementAt(i).dateYear + 1;
        var nextDateString = nextDate.toString() + "-08-31 00:00:00";
        if (_selected == values.elementAt(i).buttonValue) {
          processedStudentGrade = _studentGrade
              .where((StudentGrade s) =>
                  s.date.isAfter(DateTime.parse(dateString)) &&
                  s.date.isBefore(DateTime.parse(nextDateString)))
              .toList();
        }
      }
    } else {
      for (int i = 0; i < values.length; i++) {
        var dateString =
            values.elementAt(i).dateYear.toString() + "-09-01 00:00:00";
        var nextDate = values.elementAt(i).dateYear + 1;
        var nextDateString = nextDate.toString() + "-08-31 00:00:00";
        if (_selected == values.elementAt(i).buttonValue) {
          processedTeacherSubjects = _teacherSubjects
              .where((TeacherSubjectInfo s) =>
                  s.date.isAfter(DateTime.parse(dateString)) &&
                  s.date.isBefore(DateTime.parse(nextDateString)))
              .toList();
        }
      }
    }
  }
}
