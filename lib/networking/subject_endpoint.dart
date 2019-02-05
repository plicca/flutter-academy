import 'dart:async';
import 'dart:convert';

import 'package:clip/model/professor.dart';
import 'package:clip/model/subject.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String endpoint = "http://192.168.0.106:8080/";

Future<List<Subject>> fetchSubjectsByProfessorID(int id) async {
  final subjectSufix = "professor/getsubjects/";

  try {
    final response = await http.get(endpoint + subjectSufix + id.toString());
    return List<Subject>.from(json.decode(response.body).map((x) => Subject.fromJson(x)));
  } catch(e) {
    print(e);
  }

  return [];
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