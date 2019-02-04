import 'package:clip/networking/teacher_endpoint.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  int groupValue;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Procurar..."),
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              })
        ],
      ),
      body: RadioButtons(),
    );
  }
}

class RadioButtons extends StatefulWidget {
  RadioButtonsState createState() => new RadioButtonsState();
}

class RadioButtonsState extends State<RadioButtons> {
  int _selected = 0;

  void onChanged(int v) {
    setState(() {
      _selected = v;
    });
  }

  List<Widget> makeRadios() {
    List<Widget> list = new List<Widget>();

    list.add(new RadioListTile(
      title: Text('Alunos '),
      value: 0,
      groupValue: _selected,
      onChanged: (int v) => (onChanged(v)),
      activeColor: Colors.green,
      secondary: Icon(Icons.person_outline),
    ));
    list.add(new RadioListTile(
      title: Text('Disciplinas '),
      value: 1,
      groupValue: _selected,
      onChanged: (int v) => (onChanged(v)),
      activeColor: Colors.green,
      secondary: Icon(Icons.assignment),
    ));
    list.add(new RadioListTile(
      title: Text('Professores '),
      value: 2,
      groupValue: _selected,
      onChanged: (int v) => (onChanged(v)),
      activeColor: Colors.green,
      secondary: Icon(Icons.person),
    ));

    return list;
  }

  Widget build(BuildContext context) {
    return new Column(
      children: makeRadios(),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final suggestions = [
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

  final recentSuggestions = [
    "Eletrotecnia Teórica",
    "Eletrónica II",
    "Física II",
    "Sistemas de Tempo Real",
    "Teoria de Controlo",
  ];


  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  Widget buildResults(BuildContext context) {}

  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentSuggestions
        : suggestions.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
            onTap: () {
              showResults(context);
            },
            leading: Icon(Icons.location_city),
            title: RichText(
              text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
      itemCount: suggestionList.length,
    );
  }
}
