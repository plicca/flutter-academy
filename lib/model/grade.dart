import 'dart:convert';

class Grade {
  int subjectID;
  int studentID;
  String rank;

  Grade({this.subjectID, this.studentID, this.rank});

  String toJson() {
    return json.encode({
      'subject_id': this.subjectID,
      'student_id': this.studentID,
      'rank': this.rank,
    });
  }

  factory Grade.fromJson(Map<String, dynamic> json) {
    return Grade(
      subjectID: json['subject_id'],
      studentID: json['student_id'],
      rank: json['rank'],
    );
  }
}