import 'dart:convert';

class ProfessorSubject {
  final int id;
  final int professorID;
  final int subjectID;

  ProfessorSubject({this.id, this.professorID, this.subjectID});

  String toJson() {
    return json.encode({"ProfessorID": professorID, "SubjectID": subjectID});
  }
}