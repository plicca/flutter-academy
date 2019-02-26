import 'dart:convert';

class Shift {
  int id;
  String type;
  int shiftNum;
  int subjectID;
  int classroomID;

  Shift({this.id, this.type, this.shiftNum, this.subjectID, this.classroomID});

  String toJson() {
    return json.encode({'ID': this.id, 'Type': this.type, 'ShiftNum': this.shiftNum, 'SubjectID': this.subjectID, 'ClassroomID': this.classroomID});
  }

  factory Shift.fromJson(Map<String, dynamic> json) {
    return Shift(
      id: json['ID'],
      type: json['Type'],
      shiftNum: json['ShiftNum'],
      subjectID: json['SubjectID'],
      classroomID: json['ClassroomID']
    );
  }
}