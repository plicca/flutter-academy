import 'package:clip/config/variables.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clip/model/grade.dart';
import 'dart:async';

Future<Grade> createGrade (int subjectID, int studentID, String rank) async {
  final gradeSufix = "grade/";
  final grade = Grade(subjectid: subjectID, studentid: studentID, rank: rank);

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
  final grade = Grade(subjectid: subjectID, studentid: studentID, rank: rank);


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




