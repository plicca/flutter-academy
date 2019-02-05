import 'package:clip/model/subject.dart';
import 'package:clip/networking/subject_endpoint.dart';
import 'package:flutter/material.dart';

class Subjects extends StatefulWidget {
  @override
  _SubjectsState createState() => new _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  List<Subject> _subjects = []; //= [Subject(id: 0, name: "", description: "")];

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
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text('Disciplinas'),
      ),
      body: _buildSubjects(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

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
          if (i >= _subjects.length)
            return null;
          return _buildRow(_subjects[index]);
        });
  }

  Widget _buildRow(Subject subject) {
    return ListTile(
      title: Text(subject.name),
    );
  }
}