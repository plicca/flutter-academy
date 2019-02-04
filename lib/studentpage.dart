import 'package:flutter/material.dart';


class StudentHome extends StatefulWidget {
	@override
	//StudentHomeState createState() => new StudentHomeState();
  State<StatefulWidget> createState() {
    return StudentHomeState();
  }
}

class StudentHomeState extends State<StudentHome> {
  @override

  Widget build(BuildContext context) {
		return new Scaffold(
			appBar: new AppBar(
				title: new Text('Student Profile'),
			),
      body: _buildList() 
		);
	}

  Widget _buildList() => ListView(
      children: [
        Image.network('https://keirqld.com.au/wp-content/uploads/2016/04/man-in-office.jpg'),
        _tile('Nome do aluno: ', 'Aluno 1'),
        _tile('Numero do Aluno: ', '10000'),
        _tile('Curso: ', '1'),
        _tile('Data de inscriçao: ', DateTime.now().toUtc().toString()),
      ],
    );

  ListTile _tile (String title, String param) => ListTile(
    title: Text(title + param,
      style: TextStyle(
        fontSize: 20,
      )
    ),
  );
}