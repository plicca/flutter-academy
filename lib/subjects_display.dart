import 'package:clip/networking/teacher_endpoint.dart';
import 'package:flutter/material.dart';

class Subjects extends StatefulWidget {
  @override
  _SubjectsState createState() => new _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  final _subjects = [
    "Álgebra Linear e Geometria Analítica",
    "Análise Matemática I",
    "Desenho Assistido por Computador",
    "Programação de Microprocessadores",
    "Sistemas Lógicos I",
    "Algoritmos e Estruturas de Dados",
    "Análise Matemática II B",
    "Física I",
    "Sistemas Lógicos II",
    "Teoria de Circuitos Elétricos",
    "Análise Matemática III B",
    "Cálculo Numérico",
    "Física III",
    "Introdução às Telecomunicações",
    "Microprocessadores",
    "Análise Matemática IV B",
    "Eletrónica I",
    "Probabilidades e Estatística C",
    "Sistemas de Telecomunicações",
    "Teoria de Sinais",
    "Eletrotecnia Teórica",
    "Eletrónica II",
    "Física II",
    "Sistemas de Tempo Real",
    "Teoria de Controlo",
    "Controlo por Computador",
    "Conversão Eletromecânica de Energia",
    "Instrumentação de Medidas Elétricas",
    "Modelação de Dados em Engenharia",
    "Propagação e Radiação",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text('Disciplinas'),
      ),
      body: _buildSubjects(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget _buildSubjects() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          final index = i;
          if (i >= _subjects.length)
            return null;

          return _buildRow(_subjects[index]);
        });
  }

  Widget _buildRow(String subject) {
    return ListTile(
      title: Text(subject),
    );
  }
}