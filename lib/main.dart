import 'package:flutter/material.dart';

import 'tab.dart' as tab;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Clip',   
			theme: new ThemeData(
				fontFamily: 'Roboto',
				primaryColor: Colors.green,
			),         
			//home: new StudentHome(),
      home: new tab.Tabs(),
		);
	}
}
