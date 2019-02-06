class StudentSubjectsInfo{
  int studentID;
  String studentFirstName;
  String studentLastName;
  int subjectID;
  String subjectName;

  StudentSubjectsInfo({this.studentID, this.studentFirstName, this.studentLastName, this.subjectID, this.subjectName});

  factory StudentSubjectsInfo.fromJson(Map<String, dynamic> json) {
    return StudentSubjectsInfo(
      studentID: json['StudentID'],
      studentFirstName: json['StudentFirstName'],
      studentLastName: json['StudentLastName'],
      subjectID: json['SubjectID'],
      subjectName: json['SubjectName'],
    );
  }
}