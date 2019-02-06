import 'dart:convert';

class Professor {
  final int     id;
  final String  firstName;
  final String  lastName;
  final int     cursoID;
  final String  startDate;

  Professor({this.id, this.firstName, this.lastName, this.cursoID, this.startDate});

  factory Professor.fromJson(Map<String, dynamic> json) {
    return Professor(
      id: json['ID'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      cursoID: json['CursoID'],
      startDate: json['StartDate'],
    );
  }

  String toJson() {
    return json.encode({"first_name": firstName, "last_name": lastName, "CursoID": cursoID, "StartDate": startDate});
  }

  String toJsonSubject(int professorID, subjectID) {
    print("PROFESSORID: " + professorID.toString() + ", SUBJECTID: " + subjectID.toString());
    return json.encode({"ProfessorID": professorID, "SubjectID": subjectID});
  }
}