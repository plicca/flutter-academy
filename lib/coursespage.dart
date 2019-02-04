import 'package:flutter/material.dart';

class CoursesHome extends StatefulWidget {
	@override
	//StudentHomeState createState() => new StudentHomeState();
  State<StatefulWidget> createState() {
    return CoursesHomeState();
  }
}

class CoursesHomeState extends State<CoursesHome> {
  @override

  Widget build(BuildContext context) {
		return new Scaffold(
			appBar: new AppBar(
				title: new Text('Courses List'),
			),
      body: _buildList() 
		);
	}

  Widget _buildList() => ListView(
      children: [
        _tile('Cadeira 1'),
        _tile('Cadeira 2'),
        _tile('Cadeira 3'),
        _tile('Cadeira 4'),
        _tile('Cadeira 5'),
        
      ],
    );

  ListTile _tile (String title) => ListTile(
    title: Text(title,
      style: TextStyle(
        fontSize: 20,
      )
    ),
  );
}