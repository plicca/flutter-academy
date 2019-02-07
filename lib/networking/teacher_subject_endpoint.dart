import 'package:clip/model/teacher_subject.dart';
import 'package:http/http.dart' as http;
import 'package:clip/config/variables.dart';

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