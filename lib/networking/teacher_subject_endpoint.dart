import 'package:clip/model/subject.dart';
import 'package:clip/model/teacher_subject.dart';
import 'package:http/http.dart' as http;
import 'package:clip/config/variables.dart';
import 'dart:convert';

Future<ProfessorSubject> createProfessorSubject(int professorID, subjectID) async {
 final subjectSufix = "professor/" + professorID.toString() + "/subject/" + subjectID.toString() + "/";
 final teacher = ProfessorSubject(professorID: professorID, subjectID: subjectID);

 try {
   final response = await http.post(Uri.encodeFull(SERVER_ENDPOINT + subjectSufix), body: teacher.toJson());
 } catch (e) {
   print(e);
 }

 return new ProfessorSubject();
}


Future<List<Subject>> fetchSubjectsByProfessorIDAndSchoolYear (int professorID, String schoolYear) async {
  final subjectSufix = "subject/" + professorID.toString() + "/info/" + schoolYear + "/";
  try {
    final response = await http.get(SERVER_ENDPOINT + subjectSufix);
    return List<Subject>.from(json.decode(response.body).map((x) => Subject.fromJson(x)));
  } catch (e) {
    print(e);
  }
  return [];
}

