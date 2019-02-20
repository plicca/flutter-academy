import 'dart:convert';

class TeacherSubjectInfo {

  final int professorID;
  final int subjectID;
  final String subjectName;
  final String subjectDescription;
  final DateTime date;

  TeacherSubjectInfo ({
    this.professorID,
    this.subjectID,
    this.subjectName,
    this.subjectDescription,
    this.date,
  });

  String toJson(){
    return json.encode({
      'ProfessorID': this.professorID,
      'SubjectID': this.subjectID,
      'SubjectName': this.subjectName,
      'SubjectDescription': this.subjectDescription,
      'Date': this.date.millisecondsSinceEpoch ~/ 1000,
    });
  }

  factory TeacherSubjectInfo.fromJson(Map<String, dynamic> json) {
    return TeacherSubjectInfo(
      professorID: json['ProfessorID'],
      subjectID: json['SubjectID'],
      subjectName: json['SubjectName'],
      subjectDescription: json['SubjectDescription'],
      date: DateTime.fromMillisecondsSinceEpoch(json['Date'] * 1000),
    );
  }

}