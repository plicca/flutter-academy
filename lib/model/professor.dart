import 'dart:convert';

class Professor {
  int     id;
  String  firstName;
  String  lastName;
  int     cursoID;
  DateTime startDate;
  String email;

  Professor({this.id, this.firstName, this.lastName, this.cursoID, this.startDate, this.email});

  String toJson() {
    return json.encode({"first_name": firstName, "last_name": lastName, "CursoID": cursoID, "StartDate": startDate.millisecondsSinceEpoch ~/ 1000, 'Email': this.email});
  }

  factory Professor.fromJson(Map<String, dynamic> json) {
    return Professor(
      id: json['ID'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      cursoID: json['CursoID'],
      startDate: DateTime.fromMillisecondsSinceEpoch(json['StartDate'] * 1000),
      email: json['Email']
    );
  }
}