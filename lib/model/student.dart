class Student {
 final int id;
 final String firstName;
 final String lastName;
 final int cursoID;
 final String date;

 Student({this.id, this.firstName, this.lastName, this.cursoID, this.date});

 factory Student.fromJson(Map<String, dynamic> json) {
   return Student(
     id: json['ID'],
     firstName: json['first_name'],
     lastName: json['last_name'],
     cursoID: json['CursoID'],
     date: json['StartDate'],
   );
 }
}