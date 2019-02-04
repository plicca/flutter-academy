class Professor {
  final int id;
  final String firstName;
  final String lastName;
  final String cursoID;
  final String cadeiraID;
  final String startDate;

  Professor({this.id, this.firstName, this.lastName, this.cursoID, this.cadeiraID, this.startDate});

  factory Professor.fromJson(Map<String, dynamic> json) {
    return Professor(
      id: json['ID'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      cursoID: json['CursoIDs'],
      cadeiraID: json['CadeiraIDS'],
      startDate: json['StartDate'],
    );
  }
}