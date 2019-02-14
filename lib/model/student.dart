import 'dart:convert';

class Student {
  int id;
  String firstName;
  String lastName;
  int cursoID;
  DateTime startDate;
  String email;

  Student({this.id, this.firstName, this.lastName, this.cursoID, this.startDate, this.email});

  String toJson(){
    return json.encode({'ID': this.id, 'first_name': this.firstName, 'last_name': this.lastName, 'CursoID': this.cursoID, 'StartDate': this.startDate.millisecondsSinceEpoch ~/ 1000, 'Email': this.email});
  }

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['ID'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      cursoID: json['CursoID'],
      startDate: DateTime.fromMillisecondsSinceEpoch(json['StartDate'] * 1000),
      email: json['Email']
    );
  }
}