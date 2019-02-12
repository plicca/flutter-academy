import 'dart:convert';

class Grade {
  int subjectID;
  int studentID;
  String rank;

  Grade({this.subjectID, this.studentID, this.rank});

  factory Grade.fromJson(Map<String, dynamic> json) {
    return Grade(
      subjectID: json['subject_id'],
      studentID: json['student_id'],
      rank: json['rank'],
    );
  }

  String toJson() {
    return json.encode({"subject_id": subjectID, "student_id": studentID, "rank": rank});
  }
}