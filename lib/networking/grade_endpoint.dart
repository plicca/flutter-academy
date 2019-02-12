import 'dart:async';
import 'dart:convert';
import 'package:clip/model/grade.dart';
import 'package:http/http.dart' as http;
import 'package:clip/config/variables.dart';

Future<List<Grade>> fetchGradesByStudent(int id) async{
  final gradeSufix = "/grade/student/" + id.toString() + "/";

  try {
    final response = await http.get(SERVER_ENDPOINT + gradeSufix);
    return List<Grade>.from(json.decode(response.body).map((x) => Grade.fromJson(x)));
  } catch(err) {
    print(err);
  }
  return [];
} 