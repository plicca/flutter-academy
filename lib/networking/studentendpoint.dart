import 'dart:async';
import 'dart:convert';

import 'package:test_drive/model/student.dart';
import 'package:http/http.dart' as http;

String endpoint = "http://192.168.0.118:8080/";

Future<List<Student>> fetchStudents() async {
 final studentSufix = "students";

 try {
   final response = await http.get(endpoint + studentSufix);
   return List<Student>.from(json.decode(response.body).map((x) => Student.fromJson(x)));
 } catch(e) {
   print(e);
 }
 return [];
}