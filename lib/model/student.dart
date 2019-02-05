import 'dart:convert';

class Student {
  int id;
  String firstName;
  String lastName;
  int cursoID;
  String startDate;

  Student({this.id, this.firstName, this.lastName, this.cursoID, this.startDate});

  String toJson(){
    return json.encode({'ID': this.id, 'first_name': this.firstName, 'last_name': this.lastName, 'CursoID': this.cursoID, 'StartDate': this.startDate});
  }

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['ID'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      cursoID: json['CursoID'],
      startDate: json['StartDate'],
    );
  }
}