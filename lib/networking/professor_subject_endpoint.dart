import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:clip/model/professor_subject.dart';
import 'package:clip/model/subject.dart';

String endpoint = "http://192.168.0.107:8080/";

Future<ProfessorSubject> postProfessorSubject(int professorID, int subjectID) async {
  try {
    //"/subject/addprofessor/{professorID}/{subjectID}"
    final response = await http.post(Uri.encodeFull(
        endpoint + "subject/addprofessor/" + professorID.toString() + "/" +
            subjectID.toString()), body: toJson(professorID, subjectID));
  } catch (e) {
    print(e);
  }
}

String toJson(int professorid, int subjectid) {
  return json.encode({'ProfessorID': professorid, 'SubjectID': subjectid});
}