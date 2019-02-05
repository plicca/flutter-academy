import 'package:clip/networking/teacher_endpoint.dart';

import 'package:clip/model/professor.dart';

import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => new _SearchState();
}

class _SearchState extends State<Search> {
  @override
  final TextEditingController _filter = new TextEditingController();

  String _searchText = "";

  List filteredNames;

  List studentsNames = [
    "Lavern Colligan",
    "Bob Coomes",
    "Losonya Dematteo",
    "Maryo Kyles",
    "Carisa Watt",
    "Beryl Buchman",
    "Adrianna Aberle",
    "Tiago Marques",
    "Miguel Marcelo",
    "Pedro Albuquerque",
    "Shazia Sulemane",
    "Yuliya Prytysyuk",
    "Valeria Natasha",
    "Ricardo Walker",
  ];

  List teachersNames = [
    "Meagan Kravitz",
    "Janey Parfait",
    "Dayle Reddix",
    "Jinny Kaester",
    "Katherine Ganey",
    "Kendrick Lalley",
    "Marcelle Shaul",
    "Fracie Giffen",
    "Misha Retzlaff",
    "Paulo Pinto",
    "Paulo Montezuma",
    "Fernanda Barbosa",
    "Raul Rato",
    "Rui Neves da Silva",
  ];

  List subjects = [
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
  Icon _searchIcon = new Icon(Icons.search);

  Widget _appBarTitle = new Text('Search');
  int _selected = 0;
  final TextEditingController controller = new TextEditingController();
  void onChanged(int v) {
    setState(() {
      _selected = v;
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: _appBarTitle,
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: _searchIcon,
            onPressed: _searchPressed,
          ),
        ],
      ),
      body: new Column(
        children: <Widget>[
          new RadioListTile(
            title: Text('Alunos '),
            value: 0,
            groupValue: _selected,
            onChanged: (int v) => (onChanged(v)),
            activeColor: Colors.green,
            secondary: Icon(Icons.person_outline),
          ),
          new RadioListTile(
            title: Text('Disciplinas '),
            value: 1,
            groupValue: _selected,
            onChanged: (int v) => (onChanged(v)),
            activeColor: Colors.green,
            secondary: Icon(Icons.assignment),
          ),
          new RadioListTile(
            title: Text('Professores '),
            value: 2,
            groupValue: _selected,
            onChanged: (int v) => (onChanged(v)),
            activeColor: Colors.green,
            secondary: Icon(Icons.person),
          ),
          new Container(
            child: Expanded(
              child: _buildList(),
            ),
          ),
        ],
      ),
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);

        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search), hintText: 'Search...'),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);

        this._appBarTitle = new Text('Search');

        _filter.clear();
      }
    });
  }

  changeList() {
    if (_selected == 0) {
      filteredNames = studentsNames;
    } else if (_selected == 2) {
      filteredNames = teachersNames;
    } else if (_selected == 1) {
      filteredNames = subjects;
    }
  }

  Widget _buildList() {
    changeList();

    ExamplePageState();

    return ListView.builder(
        itemCount: filteredNames.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          return _buildRow(filteredNames[i]);
        });
  }

  Widget _buildRow(String name) {
    return ListTile(
      title: Text(name),
      onTap: () => debugPrint(name),
    );
  }

  ExamplePageState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
        });
      } else {
        setState(() {
          print(_filter.text);

          _searchText = _filter.text;

          filterText();
        });
      }
    });
  }

  void filterText() {
    var i;

    for (i = 0; i < filteredNames.length; i++) {
      if (!filteredNames
          .elementAt(i)
          .toString()
          .toLowerCase()
          .contains(_searchText.toLowerCase()))

        //print(filteredNames.elementAt(i));

        filteredNames.removeAt(i);
    }

    if (filteredNames.isEmpty) {
      filteredNames.add("No Results");
    }

    print(filteredNames);
  }
}
