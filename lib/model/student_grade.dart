import 'dart:convert';

class StudentGrade {
//  type StudentGrade struct {
//  StudentID        int
//  StudentFirstName string `gorm:"column:first_name"`
//  StudentLastName  string `gorm:"column:last_name"`
//  SubjectName      string `gorm:"column:name"`
//  SubjectID        int
//  Rank             string
//  }

  int studentID;
  String studentFirstName;
  String studentLastName;
  String subjectName;
  int subjectID;
  String rank;

  StudentGrade({
    this.studentID,
    this.studentFirstName,
    this.studentLastName,
    this.subjectName,
    this.subjectID,
    this.rank
  });

  String toJson () {
    return json.encode({
      'StudentID': this.studentID,
      'StudentFirstName': this.studentFirstName,
      'StudentLastName': this.studentLastName,
      'SubjectName': this.subjectName,
      'SubjectID': this.subjectID,
      'Rank':this.rank
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
    );
  }






}