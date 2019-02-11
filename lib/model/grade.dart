import 'dart:convert';

class Grade {
  int subjectid;
  int studentid;
  String rank;

  Grade({this.subjectid, this.studentid, this.rank});

  String toJson() {
    return json.encode({
      'subject_id': this.subjectid,
      'student_id': this.studentid,
      'rank': this.rank,
    });
  }

  factory Grade.fromJson(Map<String, dynamic> json) {
    return Grade(
      subjectid: json['subject_id'],
      studentid: json['student_id'],
      rank: json['rank'],
    );
  }
}