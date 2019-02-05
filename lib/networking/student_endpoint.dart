import 'dart:async';
import 'dart:convert';
import 'package:clip/model/student.dart';
import 'package:http/http.dart' as http;

String endpoint = "http://192.168.0.106:8080/";

Future<List<Student>> fetchStudents() async {
  final studentSufix = "student";
  try {
    final response = await http.get(endpoint + studentSufix);
    return List<Student>.from(json.decode(response.body).map((x) => Student.fromJson(x)));
  } catch (err) {
    print(err);
  }

  return [];
}

Future<Student> fetchStudent(int id) async {
  final studentSufix = "/student/" + id.toString();
  try {
    final response = await http.get(endpoint + studentSufix);
    return Student.fromJson(json.decode(response.body));
  } catch (err) {
    print(err);
  }

  return Student();
}
