import 'dart:async';
import 'dart:convert';
import 'package:clip/model/professor.dart';
import 'package:clip/model/subject.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String endpoint = "http://192.168.0.106:8080/";

Future<List<Subject>> fetchSubjectsByProfessorID(int id) async {
  final profSufix = "professor/";
  final subjectSufix = "/subject";

  try {
    final response = await http.get(endpoint + profSufix + id.toString() + subjectSufix);
    return List<Subject>.from(json.decode(response.body).map((x) => Subject.fromJson(x)));
  } catch (e) {
    print(e);
  }

  return [];
}

Future<List<Subject>> fetchSubjects() async {
  final subjectSufix = "subject";

  try {
    final response = await http.get(endpoint + subjectSufix);
    return List<Subject>.from(json.decode(response.body).map((x) => Subject.fromJson(x)));
  } catch (e) {
    print(e);
  }

  return [];
}

Future<Subject> fetchSubject(int id) async {
  final subjectSufix = "subject/" + id.toString();

  try {
    final response = await http.get(endpoint + subjectSufix);
    return Subject.fromJson(json.decode(response.body));
  } catch (e) {
    print(e);
  }

  return Subject();
}

Future<Subject> createSubject(String name, String description) async {
  final subjectSufix = "subject/create";
  final subject = Subject(name: name, description: description);

  try {
    final response = await http.post(Uri.encodeFull(endpoint + subjectSufix), body: subject.toJson());
    return Subject.fromJson(json.decode(response.body));
  } catch (e) {
    print(e);
  }

  return Subject();
}
