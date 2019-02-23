import 'dart:convert';

class Department {
  int id;
  String name;

  Department({this.id, this.name});

  String toJson(){
    return json.encode({'ID': this.id, 'Name': this.name});
  }

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      id: json['ID'],
      name: json['Name']
    );
  }
}