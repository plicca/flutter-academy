import 'package:flutter/material.dart';
import 'package:test_drive/model/student.dart';
import 'package:test_drive/model/studentsubject.dart';
import 'package:test_drive/networking/studentendpoint.dart';
import 'package:test_drive/networking/studentsubjecendpoint.dart';

class Search extends StatefulWidget {
 SearchState createState() => new SearchState();
}

class SearchState extends State<Search> with SingleTickerProviderStateMixin{

 String _searchText = "";
 Icon _searchIcon = new Icon(Icons.search);
 Widget _appBarTitle = new Text( 'Search Example' );
 final TextEditingController _filter = new TextEditingController();

 static int _selected = 0;

 void onChanged(int value) {
   setState(() {
    _selected = value;
   });
 }
  static List<Student> st = [];
  static List<StudentSubjectsInfo> ssi = [];

  void initState() {
    super.initState();
    fetchStudents().then((List<Student> x){st = x;});
    fetchStudentSubjects(1).then((List<StudentSubjectsInfo> x) {ssi = x;});
  }

 static int getSelectedState() {
   return _selected;
 }

  SearchState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

 List<Widget> makeRadios() {
   List<Widget> list = new List<Widget>();

   list.add(new RadioListTile(
     value: 1,
     title: new Text("Students"),
     groupValue: _selected,
     onChanged: (int value){onChanged(value);},
     activeColor: Colors.green,
     secondary: Icon(Icons.person)
   ));

   list.add(new RadioListTile(
     value: 2,
     title: new Text("Teachers"),
     groupValue: _selected,
     onChanged: (int value){onChanged(value);},
     activeColor: Colors.green,
     secondary: Icon(Icons.person),
   ));

   list.add(new RadioListTile(
     value: 3,
     title: new Text("Subjects"),
     groupValue: _selected,
     onChanged: (int value){onChanged(value);},
     activeColor: Colors.green,
     secondary: Icon(Icons.assignment)
   ));

   return list;
 }

  Widget buildStudentsList(List<Student> students) {
    if (_selected != 1) return new Column();
    List<Widget> list = new List<Widget>();
    if (_searchText != "") {
      for(var i = 0; i < st.length; i++) {
        String name = _searchText;
        String studentListName = students[i].firstName + ' ' + students[i].lastName;
        if (studentListName.contains(name)) {
          list.add(new Text(studentListName));
        }
      }
    }
    else {
      for(var i = 0; i < students.length; i++) {
         list.add(new Text(students[i].firstName + ' ' + students[i].lastName));
      }
    }
    return new Column(children: list);
  }

  Widget buildStudentsSubjectList(List<StudentSubjectsInfo> subjects) {
    if (_selected != 3) return new Column();
    List<Widget> list = new List<Widget>();
    for(var i = 0; i < subjects.length; i++) {
        list.add(new Text(subjects[i].subjectName));
    }
    return new Column(children: list);
  }

 @override
 Widget build(BuildContext context) {
   return new Scaffold(
     resizeToAvoidBottomPadding: false,
     appBar: _buildBar(context),
     body: new Container(
       padding: new EdgeInsets.all(32.0),
       child: new Center(
         child: new ListView(
           children: [
             new Column (
              children :makeRadios(),
             ),
              buildStudentsList(st),
              buildStudentsSubjectList(ssi),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return new AppBar(
      centerTitle: true,
      title: _appBarTitle,
      leading: new IconButton(
        icon: _searchIcon,
        onPressed: _searchPressed,
      ),
    );
  }

 void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.search),
            hintText: 'Search...'
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text( 'Search Example' );
        _filter.clear();
      }
    });
  }
}