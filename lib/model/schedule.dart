import 'dart:convert';

class Schedule {
  int id;
  int shiftID;
  int weekday;
  DateTime startTime;
  DateTime endTime;

  Schedule({this.id, this.shiftID, this.weekday, this.startTime, this.endTime});

  String toJson(){
    return json.encode({'ID': this.id, 'ShiftID': this.shiftID, 'Weekday': this.weekday, 'StartTime': this.startTime.millisecondsSinceEpoch ~/ 1000, 'EndTime': this.endTime.millisecondsSinceEpoch ~/ 1000});
  }

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      id: json['ID'],
      shiftID: json['ShiftID'],
      weekday: json['Weekday'],
      startTime: DateTime.fromMillisecondsSinceEpoch(json['StartTime'] * 1000),
      endTime: DateTime.fromMillisecondsSinceEpoch(json['EndTime'] * 1000)
    );
  }
}