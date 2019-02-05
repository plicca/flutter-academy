import 'package:clip/model/subject.dart';
import 'package:clip/networking/subject_endpoint.dart';
import 'package:clip/networking/teacher_endpoint.dart';
import 'package:flutter/material.dart';

class Subjects extends StatefulWidget {
  @override
  _SubjectsState createState() => new _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  List<Subject> _subjects = [];

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
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreateClass()),);
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
      title: Text(subject.name ?? ""),
    );
  }
}

class CreateClass extends StatelessWidget{
  TextEditingController controllerCreate = new TextEditingController();
  TextEditingController controllerDescription = new TextEditingController();

  Widget build (BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text("Create a new class"),
      ),
      body: new Container(
        padding: EdgeInsets.only(left: 10.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
            new Text("Nome da Disciplina"),
            new Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
            new TextFormField(
              controller: controllerCreate,
            ),
            new Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
            new Text("Descrição"),
            new Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
            new TextFormField(controller: controllerDescription,),
            new Padding(padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
            new RaisedButton(
              onPressed: (){
                Navigator.pop(context);
                print(controllerCreate.text);
                print(controllerDescription.text);
              },
              child: Text("Criar"),
            ),
          ],
        ),
      ),
    );
  }
}