class Student {
  int id;
  String firstName;
  String lastName;
  int cursoID;
  String startDate;

  Student({this.id, this.firstName, this.lastName, this.cursoID, this.startDate});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['ID'],
      firstName: json['FirstName'],
      lastName: json['LastName'],
      cursoID: json['CursoID'],
      startDate: json['StartDate'],
    );
  }
}
