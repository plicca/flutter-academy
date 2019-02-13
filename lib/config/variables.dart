import 'package:clip/model/professor.dart';
import 'package:clip/model/student.dart';
import 'package:flutter/material.dart';

const SERVER_ENDPOINT = "http://192.168.0.107:8080/";
final Student USER_STUDENT = Student(id: 1);
final Professor USER_TEACHER = Professor(id: 1);
bool IS_STUDENT = true;
dynamic USER;
Color USER_COLOR;