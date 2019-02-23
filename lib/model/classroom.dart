import 'dart:convert';

class Classroom {
  int id;
  String name;
  int departmentID;

  Classroom({this.id, this.name, this.departmentID});

  String toJson(){
    return json.encode({'ID': this.id, 'Name': this.name, 'DepartmentID': this.departmentID});
  }

  factory Classroom.fromJson(Map<String, dynamic> json) {
    return Classroom(
      id: json['ID'],
      name: json['Name'],
      departmentID: json['DepartmentID']
    );
  }
}