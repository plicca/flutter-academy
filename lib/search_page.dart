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
        title: new Text("Search..."),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: SearchData());
            }
          )
        ],
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            children: makeRadios(),
          ),
        ),
      ),
    );
  }
}

class SearchData extends SearchDelegate<String> {

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("This is where searched data will show...")
        ],
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List recentSearch, searchList;

    if (selected != 0) {
      if (selected == 1) {
        recentSearch = recentStudents;
        searchList = students;
      }

      if (selected == 2) {
        recentSearch = recentProfs;
        searchList = profs;
      }

      if (selected == 3) {
        recentSearch = recentSubjects;
        searchList = subjects;
      }
    }

    final suggestionList = query.isEmpty ? recentSearch : searchList.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.arrow_right),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0, query.length),
            style: new TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold
            ),
            children: [TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey)
            )]
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}