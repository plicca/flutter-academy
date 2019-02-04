import 'package:flutter/material.dart';

class CoursesHome extends StatefulWidget {
	@override
	//StudentHomeState createState() => new StudentHomeState();
  State<StatefulWidget> createState() {
    return CoursesHomeState();
  }
}

class CoursesHomeState extends State<CoursesHome> {
  final subjects = [
    "Álgebra Linear e Geometria Analítica",
    "Análise Matemática I",
    "Desenho Assistido por Computador",
    "Programação de Microprocessadores",
    "Sistemas Lógicos I",
    "Algoritmos e Estruturas de Dados",
    "Análise Matemática II",
    "Física I",
    "Sistemas Lógicos II",
    "Teoria de Circuitos Elétricos",
    "Análise Matemática III",
    "Cálculo Numérico",
    "Física III",
    "Introdução às Telecomunicações",
    "Teoria de Sinais",
    "Eletrotecnia Teórica",
    "Eletrónica II",
    "Física II",
    "Sistemas de Tempo Real"
  ];

  @override

  Widget build(BuildContext context) {
		return new Scaffold(
			appBar: new AppBar(
				title: new Text('Courses List'),
			),
      body: _buildList() 
		);
	}

  Widget _buildList() {
      return ListView.builder(
      padding: new EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        final index = i;
        if (i >= subjects.length)
          return null;
        
        return buildRow(subjects[index]);
      },
    );
  }

  Widget buildRow(String subject) {
    return ListTile(
      title: new Text(subject)
    );
  }
}