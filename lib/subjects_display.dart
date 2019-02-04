import 'package:flutter/material.dart';

class Subjects extends StatefulWidget {
  @override
  SubjectsState createState() => new SubjectsState();
}

class SubjectsState extends State<Subjects> {
  
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

  Widget buildSubjects() {
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: new Text("Subjects"),
      ),
      body: buildSubjects(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {},
        child: new Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}