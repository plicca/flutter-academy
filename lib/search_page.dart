import 'package:clip/config/locales.dart';
import 'package:clip/config/variables.dart';
import 'package:clip/model/student.dart';
import 'package:clip/model/subject.dart';
import 'package:clip/networking/student_endpoint.dart';
import 'package:clip/networking/subject_endpoint.dart';
import 'package:clip/networking/teacher_endpoint.dart';
import 'package:clip/model/professor.dart';
import 'package:clip/subject_info.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => new _SearchState();
}

class _SearchState extends State<Search> {
  @override
  final TextEditingController _filter = new TextEditingController();

  String _searchText = "";
  List<Professor> teachers = [];
  List<Professor> processedTeachers = [];
  List<Subject> subjects = [];
  List<Subject> processedSubjects = [];
  List<Student> students = [];
  List<Student> processedStudents = [];

  void initState() {
    super.initState();
    fetchTeachers().then((List<Professor> x) {
      setState(() {
        teachers = x;
        processedTeachers = x;
      });
    });
    fetchSubjects().then((List<Subject> x) {
      setState(() {
        subjects = x;
        processedSubjects = x;
      });
    });
    fetchStudents().then((List<Student> x) {
      setState(() {
        students = x;
        processedStudents = x;
      });
    });
    generateTextFilterListener();
  }

  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text(LocaleHolder.getValue(SEARCH));
  int _selected = 0;
  final TextEditingController controller = new TextEditingController();

  void onChanged(int v) {
    setState(() {
      _selected = v;
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          centerTitle: true,
          title: _appBarTitle,
          backgroundColor: USER_COLOR,
          actions: <Widget>[
            IconButton(
              icon: _searchIcon,
              onPressed: _searchPressed,
            ),
          ],
        ),
        body: new Column(
          children: <Widget>[
            new Center(
                child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(LocaleHolder.getValue(SEARCH_OPTION), style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                new Padding(
                  padding: new EdgeInsets.only(left: 10.0),
                ),
                new DropdownButton(
                  value: _selected,
                  items: [
                    new DropdownMenuItem(
                      child: new Text(LocaleHolder.getValue(STUDENTS)),
                      value: 0,
                    ),
                    new DropdownMenuItem(
                      child: new Text(LocaleHolder.getValue(TEACHERS)),
                      value: 1,
                    ),
                    new DropdownMenuItem(
                      child: new Text(LocaleHolder.getValue(SUBJECTS)),
                      value: 2,
                    )
                  ],
                  onChanged: onChanged,
                ),
              ],
            )),
            new Container(
              child: Expanded(
                child: _buildList(),
              ),
            )
          ],
        ));
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(prefixIcon: new Icon(Icons.search), hintText: LocaleHolder.getValue(SEARCH) + "..."),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text(LocaleHolder.getValue(SEARCH));
        _filter.clear();
      }
    });
  }

  Widget _buildList() {
    int itemCount = 0;
    switch (_selected) {
      case 0:
        itemCount = processedStudents.length;
        break;
      case 1:
        itemCount = processedTeachers.length;
        break;
      case 2:
        itemCount = processedSubjects.length;
        break;
    }

    return ListView.builder(
        itemCount: itemCount,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          return _buildRow(i);
        });
  }

  Widget _buildRow(int i) {
    String name = "";
    switch (_selected) {
      case 0:
        name = "(" + processedStudents[i].id.toString() + ") " + processedStudents[i].firstName + " " + processedStudents[i].lastName;
        break;
      case 1:
        name = "(" + processedTeachers[i].id.toString() + ") " + processedTeachers[i].firstName + " " + processedTeachers[i].lastName;
        break;
      case 2:
        name = "(" + processedSubjects[i].id.toString() + ") " + processedSubjects[i].name;
        break;
    }

    return ListTile(
      title: Text(name),
      onTap: () {
        if (_selected == 2) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SubjectInfo(subject: processedSubjects[i])));
        }
      },
    );
  }

  void generateTextFilterListener() {
    _filter.addListener(() {
      _searchText = _filter.text ?? "";
      filterText();
    });
  }

  void filterText() {
    if (_selected == 0) {
      processedStudents = students
          .where((Student s) =>
              s.firstName.toLowerCase().startsWith(_searchText.toLowerCase()) ||
              s.lastName.toLowerCase().startsWith(_searchText.toLowerCase()))
          .toList();
      setState(() {
        processedStudents = processedStudents;
      });
    } else if (_selected == 1) {
      processedTeachers = teachers
          .where((Professor p) =>
              p.firstName.toLowerCase().startsWith(_searchText.toLowerCase()) ||
              p.lastName.toLowerCase().startsWith(_searchText.toLowerCase()))
          .toList();
      setState(() {
        processedTeachers = processedTeachers;
      });
    } else if (_selected == 2) {
      processedSubjects = subjects.where((Subject s) => s.name.toLowerCase().startsWith(_searchText.toLowerCase())).toList();
      setState(() {
        processedSubjects = processedSubjects;
      });
    }
  }
}
