import 'dart:convert';

class StudentGrade {

  int studentID;
  String studentFirstName;
  String studentLastName;
  String subjectName;
  int subjectID;
  String rank;
  DateTime date;

  StudentGrade({
    this.studentID,
    this.studentFirstName,
    this.studentLastName,
    this.subjectName,
    this.subjectID,
    this.rank,
    this.date
  });

  String toJson () {
    return json.encode({
      'StudentID': this.studentID,
      'StudentFirstName': this.studentFirstName,
      'StudentLastName': this.studentLastName,
      'SubjectName': this.subjectName,
      'SubjectID': this.subjectID,
      'Rank':this.rank,
      'Date': this.date.millisecondsSinceEpoch ~/ 1000,
    });
  }

  factory StudentGrade.fromJson(Map<String, dynamic> json) {
    return StudentGrade (
      studentID: json['StudentID'],
      studentFirstName: json['StudentFirstName'],
      studentLastName: json ['StudentLastName'],
      subjectName: json['SubjectName'],
      subjectID: json['SubjectID'],
      rank: json['Rank'],
      date: DateTime.fromMillisecondsSinceEpoch(json['Date'] * 1000),
    );
  }






}