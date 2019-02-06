import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:clip/model/professor.dart';

String endpoint = "http://192.168.0.107:8080/";

Future<List<Professor>> fetchTeachers() async {
  final profSufix = "professor";
  final response = await http.get(endpoint + profSufix);

  try {
    // If server returns an OK response, parse the JSON
    return List<Professor>.from(
        json.decode(response.body).map((x) => Professor.fromJson(x)));
  } catch (e) {
    // If that response was not OK, throw an error.
    //throw Exception('Failed to load post');
    print(e);
  }
  return [];
}

Future<Professor> fetchProfessorbyID(int id) async {
  final profSufix = "professor/";

  try {
    final response = await http.get(endpoint + profSufix + id.toString());
    print(response);
    return Professor.fromJson(json.decode(response.body));
  } catch (e) {
    print(e);
  }
}

Future<List<Professor>> fetchProfessorsbySubjectID(int subjectID) async {
  final profSufix = "/subject/getprofessors/";

  try {
    final response =
        await http.get(endpoint + profSufix + subjectID.toString());
    return List<Professor>.from(
        json.decode(response.body).map((x) => Professor.fromJson(x)));
  } catch (e) {
    print(e);
  }
  return [];
}
