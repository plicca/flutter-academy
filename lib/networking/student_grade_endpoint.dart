import 'dart:async';
import 'dart:convert';
import 'package:clip/model/student_grade.dart';
import 'package:http/http.dart' as http;
import 'package:clip/config/variables.dart';

Future<List<StudentGrade>> fetchStudentGrade(int id) async {
  final studentGradeSufix = "grade/" + id.toString() + "/info/";
  try {
    final response = await http.get(SERVER_ENDPOINT + studentGradeSufix);
    return List<StudentGrade>.from(json.decode(response.body).map((x) => StudentGrade.fromJson(x)));
  } catch (e) {
    print(e);
  }
  return [];
}

Future<List<StudentGrade>> fetchSubjectsByStudentIDAndSchoolYear (int studentID, String schoolYear) async {
  final studentSufix = "grade/" + studentID.toString() + "/info/" + schoolYear +"/";
  try {
    final response = await http.get(SERVER_ENDPOINT + studentSufix);
    return List<StudentGrade>.from(json.decode(response.body).map((x) => StudentGrade.fromJson(x)));
  } catch (e) {
  print(e);
  }
  return [];
}