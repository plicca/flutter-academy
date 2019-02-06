import 'dart:async';
import 'dart:convert';

import 'package:test_drive/model/studentsubject.dart';
import 'package:http/http.dart' as http;

String endpoint = "http://192.168.0.118:8080/";

Future<List<StudentSubjectsInfo>> fetchStudentSubjects(int studentID) async {
 final studentSufix = "student/" + studentID.toString() + "/info";

  try {
    final response = await http.get(endpoint + studentSufix);
    return List<StudentSubjectsInfo>.from(json.decode(response.body).map((x) => StudentSubjectsInfo.fromJson(x)));
  } catch(err) {
    print(err);
  }
  return [];
}
