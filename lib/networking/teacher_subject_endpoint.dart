import 'package:clip/model/teacher_subject.dart';
import 'package:http/http.dart' as http;

final endpoint = "http://192.168.0.106:8080/";

void createProfessorSubject(int professorID, subjectID) async {
  final subjectSufix = "professor/" + professorID.toString() + "/addtosubject/" + subjectID.toString();
  final teacher = ProfessorSubject(professorID: professorID, subjectID: subjectID);

  try {
    final response = await http.post(Uri.encodeFull(endpoint + subjectSufix), body: teacher.toJson());
  } catch (e) {
    print(e);
  }
}