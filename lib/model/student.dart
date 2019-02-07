import 'dart:convert';
import 'package:date_format/date_format.dart';

class Student {
  int id;
  String firstName;
  String lastName;
  int cursoID;
  String startDate;

  Student({this.id, this.firstName, this.lastName, this.cursoID, this.startDate});

  void convertDateFromString(String strDate){
    DateTime todayDate = DateTime.parse(strDate);
    print(todayDate);
    print(formatDate(todayDate, [yyyy, '/', mm, '/', dd, ' ', hh, ':', mm, ':', ss, ' ', am]));
 }

  String toJson(){
    return json.encode({'ID': this.id, 'first_name': this.firstName, 'last_name': this.lastName, 'CursoID': this.cursoID, 'StartDate': this.startDate});
  }

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['ID'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      cursoID: json['CursoID'],
      startDate: json['StartDate'],
    );
  }
}