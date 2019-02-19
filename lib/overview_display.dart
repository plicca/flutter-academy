import 'package:clip/config/variables.dart';
import 'package:clip/model/student_grade.dart';
import 'package:clip/networking/student_grade_endpoint.dart';
import 'package:flutter/material.dart';

class Overview extends StatefulWidget {

  _Overview createState() => new _Overview();
}

class _Overview extends State<Overview> {
  List<StudentGrade> _grades = [];

  void initState () {
    super.initState();
    fetchStudentGrade(USER_STUDENT.id).then((List<StudentGrade> x) {
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
      title: Text("(" + grade.subjectID.toString() + ") "+ grade.subjectName),
      subtitle: Text("Evaluation: " + grade.rank, style: TextStyle(fontSize: 16.0)),
      onTap: () {
        debugPrint(grade.subjectID.toString());
      },
    );
  }
}