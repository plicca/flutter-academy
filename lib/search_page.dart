import 'package:flutter/material.dart';

  final students = [
    "Tiago",
    "Pedro",
    "Francisco",
    "Shazia",
  ];

  final profs = [
    "António",
    "Manuel",
    "Gedeão",
    "Paulo"
  ];

  final subjects = [
    "Eletrónica 1",
    "Eletrónica 2",
    "Programação de Microprocessadores",
    "Análise Matemática 1"
  ];

  final recentSubjects = [
    "Eletrónica 1",
    "Eletrónica 2"
  ];

  final recentProfs = [
    "Paulo",
    "Gedeão"
  ];

  final recentStudents = [
    "Tiago",
    "Pedro"
  ];

  int selected = 1;

class Search extends StatefulWidget {
  SearchState createState() => new SearchState();
}

class SearchState extends State<Search> with SingleTickerProviderStateMixin{

  void onChanged(int value) {
    setState(() {
     selected = value; 
    });
  }

  List<Widget> makeRadios() {
    List<Widget> list = new List<Widget>();

    list.add(new RadioListTile(
      value: 1,
      title: new Text("Students"),
      groupValue: selected,
      onChanged: (int value){onChanged(value);},
      activeColor: Colors.green,
      secondary: Icon(Icons.person)
    ));

    list.add(new RadioListTile(
      value: 2,
      title: new Text("Teachers"),
      groupValue: selected,
      onChanged: (int value){onChanged(value);},
      activeColor: Colors.green,
      secondary: Icon(Icons.person),
    ));

    list.add(new RadioListTile(
      value: 3,
      title: new Text("Subjects"),
      groupValue: selected,
      onChanged: (int value){onChanged(value);},
      activeColor: Colors.green,
      secondary: Icon(Icons.assignment)
    ));

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: new Text("Search Tool"),
        centerTitle: true,
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Column(
              children: makeRadios()
            ),
            new Padding(
              padding: new EdgeInsets.only(top: 10.0, right: 25.0, left: 25.0),
              child: new Column(
                children: <Widget>[
                  new TextField(
                    decoration: new InputDecoration(
                      hintText: "Procurar..."
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
      /* new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: makeRadios(),
          ),
        ),
      ), */
    );
  }
}
