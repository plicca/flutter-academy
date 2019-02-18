import 'dart:convert';

class ProfessorSubject {
 final int id;
 final int professorID;
 final int subjectID;
 final DateTime date;

 ProfessorSubject({this.id, this.professorID, this.subjectID, this.date});

 String toJson() {
   return json.encode({"ProfessorID": professorID, "SubjectID": subjectID});
 }
}