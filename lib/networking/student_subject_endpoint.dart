import 'dart:async';
import 'dart:convert';
import 'package:clip/model/student_subject_info.dart';
import 'package:http/http.dart' as http;
import 'package:clip/config/variables.dart';

Future<List<StudentSubjectsInfo>> fetchStudentSubjects(int studentID) async {
 final studentSufix = "student/" + studentID.toString() + "/info/";

  try {
    final response = await http.get(SERVER_ENDPOINT + studentSufix);
    return List<StudentSubjectsInfo>.from(json.decode(response.body).map((x) => StudentSubjectsInfo.fromJson(x)));
  } catch(err) {
    print(err);
  }
  return [];
}