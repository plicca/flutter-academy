import 'dart:convert';

class User {
  int id;
  String firstName;
  String lastName;
  int cursoID;
  DateTime startDate;
  String email;

  User({this.id, this.firstName, this.lastName, this.cursoID, this.startDate, this.email});

  String toJson(){
    return json.encode({'ID': this.id, 'first_name': this.firstName, 'last_name': this.lastName, 'CursoID': this.cursoID, 'StartDate': this.startDate.millisecondsSinceEpoch ~/ 1000, 'Email': this.email});
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['ID'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      cursoID: json['CursoID'],
      startDate: DateTime.fromMillisecondsSinceEpoch(json['StartDate'] * 1000),
      email: json['Email']
    );
  }
}