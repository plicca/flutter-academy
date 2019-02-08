import 'dart:async';
import 'dart:convert';
import 'package:clip/model/student.dart';
import 'package:http/http.dart' as http;
import 'package:clip/config/variables.dart';

Future<List<Student>> fetchStudents() async {
 final studentSufix = "student/";

  try {
    final response = await http.get(SERVER_ENDPOINT + studentSufix);
    return List<Student>.from(json.decode(response.body).map((x) => Student.fromJson(x)));
  } catch(err) {
    print(err);
  }
  return [];
}

Future<Student> fetchStudent(int id) async {
  final studentSufix = "student/" + id.toString() + "/";

  try {
    final response = await http.get(SERVER_ENDPOINT + studentSufix);
    return Student.fromJson(json.decode(response.body));
  } catch(err) {
    print(err);
  }
  return new Student();
}

Future<Student> updateStudent(Student student) async {
  final studentSufix = "student/";

  try {
    final response = await http.put(SERVER_ENDPOINT + studentSufix, body: student.toJson());
    return Student.fromJson(json.decode(response.body));
  } catch(err) {
    print(err);
  }
  return new Student();
}