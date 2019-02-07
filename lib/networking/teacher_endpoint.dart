import 'dart:async';
import 'dart:convert';
import 'package:clip/model/professor.dart';
import 'package:http/http.dart' as http;
import 'package:clip/config/variables.dart';

Future<List<Professor>> fetchTeachers() async {
  final profSufix = "professor/";

  try {
    final response = await http.get(SERVER_ENDPOINT + profSufix);
    return List<Professor>.from(
        json.decode(response.body).map((x) => Professor.fromJson(x)));
  } catch (e) {
    print(e);
  }

  return [];
}

Future<Professor> fetchTeacher(int id) async {
  final profSufix = "professor/" + id.toString() + "/";

  try {
    final response = await http.get(SERVER_ENDPOINT + profSufix);
    return Professor.fromJson(json.decode(response.body));
  } catch (e) {
    print(e);
  }

  return Professor();
}
