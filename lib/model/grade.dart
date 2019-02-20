import 'dart:convert';

class Grade {
  int subjectID;
  int studentID;
  String rank;
  DateTime date;

  Grade({this.subjectID, this.studentID, this.rank, this.date});

  factory Grade.fromJson(Map<String, dynamic> json) {
    return Grade(
      subjectID: json['subject_id'],
      studentID: json['student_id'],
      rank: json['rank'],
      date: DateTime.fromMillisecondsSinceEpoch(json['date'] * 1000),
    );
  }

  String toJson() {
    return json.encode({"subject_id": subjectID, "student_id": studentID, "rank": rank, "date": date.millisecondsSinceEpoch ~/ 1000});
  }
}