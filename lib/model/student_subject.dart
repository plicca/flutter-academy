import 'dart:convert';

class StudentSubject {
  int id;
  int studentID;
  int subjectID;
  DateTime date;

  StudentSubject({this.id, this.studentID, this.subjectID, this.date});

  String toJson(){
    return json.encode({'ID': this.id, 'StudentID': this.studentID, 'SubjectID': this.subjectID, 'Date': this.date.millisecondsSinceEpoch ~/ 1000});
  }

  factory StudentSubject.fromJson(Map<String, dynamic> json) {
    return StudentSubject(
      id: json['ID'],
      studentID: json['StudentID'],
      subjectID: json['SubjectID'],
      date: DateTime.fromMillisecondsSinceEpoch(json['Date'] * 1000),
    );
  }
}