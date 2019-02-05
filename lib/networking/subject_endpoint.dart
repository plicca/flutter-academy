import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:clip/model/subject.dart';

String endpoint = "http://192.168.0.107:8080/";

Future<List<Subject>> fetchSubjectsbyProfessorID (int professorID) async {
  final subjectSufix = "/professor/getclasses/";

  try {
    final response = await http.get(endpoint + subjectSufix + professorID.toString());
    return  List<Subject>.from(json.decode(response.body).map((x) => Subject.fromJson(x)));
  } catch (e) {
    print(e);
  }
}

Future<List<Subject>> fetchSubjects() async {
  final subjectSufix = "subject";

  try {
    final response = await http.get(endpoint + subjectSufix);
    return List<Subject>.from(json.decode(response.body).map((x) => Subject.fromJson(x)));
  } catch(e) {
  print(e);
  }

  return [];
}

