import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {

  final TextEditingController controller = new TextEditingController();
  String searchText = "";
  List<dynamic> filteredSearchs = [];
  Icon searchIcon = new Icon(Icons.search);
  Widget appBarTitle = new Text("Search Tool");
  int selected = 0;

  List students = [
    "Tiago Marques",
    "Pedro Oliveira",
    "Shazia Sulemane",
    "Ricardo Walker"
  ];

  List teachers = [
    "Paulo Montezuma",
    "Rui Dinis",
    "Paulo Pinto",
    "Rui Costa",
    "Paulo Cortês"
  ];

  List subjects = [
    "Álgebra Linear e Geometria Analítica",
    "Análise Matemática I",
    "Desenho Assistido por Computador",
    "Programação de Microprocessadores",
    "Sistemas Lógicos I",
    "Algoritmos e Estruturas de Dados",
    "Análise Matemática II B",
    "Física I"
  ];

  void onChanged(int value) {
    setState(() {
     selected = value; 
    });
  }

  List<Widget> showRadiosAndList() {

    List<Widget> auxList = [];

    auxList.add(new RadioListTile(
      title: Text('Alunos'),
      value: 0,
      groupValue: selected,
      onChanged: (int value) => (onChanged(value)),
      activeColor: Colors.green,
      secondary: Icon(Icons.person),
    ));

    auxList.add(new RadioListTile(
      title: Text('Professores'),
      value: 1,
      groupValue: selected,
      onChanged: (int value) => (onChanged(value)),
      activeColor: Colors.green,
      secondary: Icon(Icons.person),
    ));

    auxList.add(new RadioListTile(
      title: Text('Professores'),
      value: 2,
      groupValue: selected,
      onChanged: (int value) => (onChanged(value)),
      activeColor: Colors.green,
      secondary: Icon(Icons.assignment),
    ));

    auxList.add(new Container(
      child: Expanded(
        child: buildList(),
      ),
    ));

    return auxList;
  }

  void searchPressed() {
    setState(() {
      if (this.searchIcon == Icon(Icons.search)) {
        this.searchIcon = new Icon(Icons.close);
        this.appBarTitle = new TextField(
          controller: controller,
          decoration: new InputDecoration(
            prefixIcon: new Icon(Icons.search),
            hintText: "Search..."
          ),
        );
      } else {
        this.searchIcon = new Icon(Icons.search);
        this.appBarTitle = new Text("Search Tool");
        controller.clear();
      }
    });
  }

  void searchListSpecifier() {
    if (selected == 0) {
      filteredSearchs = students;
    } else if (selected == 1) {
      filteredSearchs = teachers;
    } else if (selected == 2) {
      filteredSearchs = subjects;
    }
  }

  Widget buildList() {
    searchListSpecifier();

    controller.addListener(() {
      if (controller.text.isEmpty) {
        setState(() {
         searchText = ""; 
        });
      } else {
        setState(() {
          print(controller.text);
          searchText = controller.text; 
          List tempList = new List();

          for (int i = 0; i < filteredSearchs.length; i++) {
            if(!filteredSearchs[i].toLowerCase().contains(searchText.toLowerCase())) {
              tempList.add(filteredSearchs[i]);
            }
          }
         
          if(tempList.isEmpty) {
           tempList.add("No results...");
          }

          filteredSearchs = tempList;
          print(filteredSearchs);
        });
      }
    });

    return ListView.builder(
      itemCount: filteredSearchs.length,
      padding: new EdgeInsets.all(10.0),
      itemBuilder: (context, i) {
        return ListTile(
          title: filteredSearchs[i],
          onTap: () => debugPrint(filteredSearchs[i]),
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        centerTitle: true,
        title: appBarTitle,
        backgroundColor: Colors.green,
        actions: <Widget>[
          new IconButton(
            icon: searchIcon,
            onPressed: searchPressed,
          ),
        ],
      ),
      body: new Column(
        children: showRadiosAndList(),
      ),
    );
  }
}