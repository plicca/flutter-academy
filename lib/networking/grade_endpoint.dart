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

Future<Grade> createGrade (int subjectID, int studentID, String rank) async {
  final gradeSufix = "grade/";
  final grade = Grade(subjectID: subjectID, studentID: studentID, rank: rank);

  try {
    final response = await http.post(SERVER_ENDPOINT + gradeSufix, body: grade.toJson());
    if (response.statusCode != 200) {
      print("statusCode: " + response.statusCode.toString());
      return null;
    }
    return Grade.fromJson(json.decode(response.body));
  } catch (e) {
    print(e);
  }

  return Grade();

}

Future<Grade> updateGrade (int subjectID, int studentID, String rank) async {
  final gradeSufix = "grade/";
  final grade = Grade(subjectID: subjectID, studentID: studentID, rank: rank);


  try {
    final response = await http.put(SERVER_ENDPOINT+gradeSufix, body: grade.toJson());
    if (response.statusCode != 200) {
      print("statusCode: " + response.statusCode.toString());
      return null;
    }
    return Grade.fromJson(json.decode(response.body));
  } catch (e) {
    print(e);
  }
  return Grade();
}