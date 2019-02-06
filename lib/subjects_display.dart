import 'package:flutter/material.dart';
import 'package:clip/model/student_subject_info.dart';
import 'package:clip/networking/student_subject_endpoint.dart';

List<StudentSubjectsInfo> currentInfo = new List<StudentSubjectsInfo>();

class Subjects extends StatefulWidget {
  @override
  SubjectsState createState() => new SubjectsState();
}

class SubjectsState extends State<Subjects> {

  void initState(){
    super.initState();
    fetchStudentSubjects(1).then((List<StudentSubjectsInfo> receivedInfo) {
      setState(() {
        currentInfo = receivedInfo;
      });
    });
  }

  Widget buildSubjects() {
    return ListView.builder(
      padding: new EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        final index = i;
        if (i >= currentInfo.length)
          return null;
        
        return buildRow(currentInfo[index].subjectName ?? "");
      },
    );
  }

  Widget buildRow(String subjectName) {
    return ListTile(
      title: new Text(subjectName)
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: buildSubjects(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {},
        child: new Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}