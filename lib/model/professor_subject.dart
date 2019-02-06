class ProfessorSubject {
  int id;
  int professorid;
  int subjectid;

  ProfessorSubject({this.id, this.professorid, this.subjectid});

  factory ProfessorSubject.fromJson(Map<String, dynamic> json) {
    return ProfessorSubject(
      id: json['ID'],
      professorid : json['ProfessrID'],
      subjectid : json['SubjectID'],
    );
  }
}
