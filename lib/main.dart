import 'package:flutter/material.dart';

import 'courseshome.dart';
import 'studenthome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Startup Name Generator',   
			theme: new ThemeData(
				fontFamily: 'Roboto',
				primaryColor: Colors.green,
			),         
			//home: new StudentHome(),
      home: new CoursesHome(),
		);
	}
}

/*class CoursesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CoursesPageState();
  }
}

class CoursesPageState extends State<CoursesPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
    );
  }
}*/
