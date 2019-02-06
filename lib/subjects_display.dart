import 'package:clip/model/subject.dart';
import 'package:clip/networking/subject_endpoint.dart';
import 'package:flutter/material.dart';
import 'package:clip/networking/professor_subject_endpoint.dart';



class Subjects extends StatefulWidget {
  @override
  _SubjectsState createState() => new _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  List<Subject> _subjects = []; //= [Subject(id: 0, name: "", description: "")];

  void initState() {
    super.initState();
    fetchSubjectsbyProfessorID(1).then((List<Subject> x) {
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateSubjectScreen()),
          );
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

class CreateSubjectScreen extends StatefulWidget {
  _CreateSubjectScreenState createState() => new _CreateSubjectScreenState();
}

class _CreateSubjectScreenState extends State<CreateSubjectScreen> {
  final controllerName = TextEditingController();
  final controllerDescription = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    controllerName.dispose();
    controllerDescription.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green,
          title: Text("Criar Disciplina"),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              new Padding(padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0)),
              new Text("Nome da disciplina: ", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
              TextFormField(
                controller: controllerName,
              ),
              new Padding(padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0)),
              new Text("Descrição: ", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
              TextFormField(
                controller: controllerDescription,
              ),
              new Padding(padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0)),
              Center(
                child: RaisedButton(
                  onPressed: () async {
                    final subject = await createSubject(controllerName.text, controllerDescription.text);
                    postProfessorSubject(1, subject.id);
                    Navigator.pop(context);
                  },
                  child: Text("Criar"),
                ),
              ),
            ],
          ),
        )
    );
  }
}
