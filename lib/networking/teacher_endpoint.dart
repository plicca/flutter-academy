import 'dart:async';
import 'dart:convert';

import 'package:clip/model/professor.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String endpoint = "http://192.168.0.106:8080/";

Future<List<Professor>> fetchTeachers() async {
  final profSufix = "professors";

  try {
    final response = await http.get(endpoint + profSufix);
    return List<Professor>.from(json.decode(response.body).map((x) => Professor.fromJson(x)));
  } catch(e) {
    print(e);
  }

  return [];
}

Future<Professor> fetchTeacher(int id) async {
  final profSufix = "professor/" + id.toString();

  try {
    final response = await http.get(endpoint + profSufix);
    return Professor.fromJson(json.decode(response.body));
  } catch(e) {
  print(e);
  }

  return null;
}

//class GetAllProfessors extends StatefulWidget {
//  _GetAllProfessorsState createState() => new _GetAllProfessorsState();
//}
//
//class _GetAllProfessorsState extends State<GetAllProfessors> {
//
//  Widget build(BuildContext context) {
//    final professors = [];
//    for (int i = 1; i < 5 ; i++) {
//      fetchPost("http://192.168.0.106/professor/" + i.toString());
//
//    }
//  }
//}