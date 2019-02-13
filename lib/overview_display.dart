import 'package:clip/config/variables.dart';
import 'package:clip/model/grade.dart';
import 'package:clip/model/student_grade.dart';
import 'package:clip/model/subject.dart';
import 'package:clip/networking/student_grade_endpoint.dart';
import 'package:clip/networking/subject_endpoint.dart';
import 'package:flutter/material.dart';

class Overview extends StatefulWidget {
  @override
  final int studentID;
  Overview({this.studentID});
  _Overview createState() => new _Overview(studentID: studentID);
}

class _Overview extends State<Overview> {
  final int studentID;
  List<StudentGrade> _grades = [];

  _Overview ({this.studentID});

  void initState () {
    super.initState();
    fetchStudentGrade(studentID).then((List<StudentGrade> x) {
      setState(() {
       _grades = x;
      });
    });
  }

  Widget build (BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text("Overview"),
        backgroundColor: USER_COLOR,
      ),
      body: _buildOverview(),
    );
  }

  Widget _buildOverview () {
    return ListView.builder(
        itemBuilder: (context, i) {
          final index = i;
          if (i >= _grades.length) return null;
          return _buildRow(_grades[index]);
        }
    );
  }

  Widget _buildRow(StudentGrade grade) {
    return ListTile(
      title: Text(
          "(" + grade.subjectID.toString() + ") "
          + grade.subjectName + " "
          //+ grade.rank
      ),
      subtitle: Text(
        "Avaliação: " + grade.rank,
        style: TextStyle(fontSize: 16.0,),
      ),
      onTap: () {
        debugPrint(grade.subjectID.toString());
      },
    );
  }
}