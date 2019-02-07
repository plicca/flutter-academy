import 'package:clip/model/subject.dart';
import 'package:clip/networking/subject_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:clip/create_subjects_screen.dart';

class Subjects extends StatefulWidget {
  @override
  _SubjectsState createState() => new _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  List<Subject> _subjects = [];

  void initState() {
    super.initState();
    fetchSubjectsByProfessorID(2).then((List<Subject> x) {
      setState(() {
        _subjects = x;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSubjects(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => CreateSubjectScreen()));
          setState(() {
            _subjects.add(result);
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget _buildSubjects() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          final index = i;
          if (i >= _subjects.length) return null;
          return _buildRow(_subjects[index]);
        });
  }

  Widget _buildRow(Subject subject) {
    return ListTile(
      title: Text(subject.name),
    );
  }
}