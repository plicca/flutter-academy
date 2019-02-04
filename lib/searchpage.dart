import 'package:flutter/material.dart';

class Search extends StatefulWidget {
 SearchState createState() => new SearchState();
}

class SearchState extends State<Search> with SingleTickerProviderStateMixin{

 static int _selected = 0;

 void onChanged(int value) {
   setState(() {
    _selected = value;
   });
 }

 static int getSelectedState() {
   return _selected;
 }

 List<Widget> makeRadios() {
   List<Widget> list = new List<Widget>();

   list.add(new RadioListTile(
     value: 1,
     title: new Text("Students"),
     groupValue: _selected,
     onChanged: (int value){onChanged(value);},
     activeColor: Colors.green,
     secondary: Icon(Icons.person)
   ));

   list.add(new RadioListTile(
     value: 2,
     title: new Text("Teachers"),
     groupValue: _selected,
     onChanged: (int value){onChanged(value);},
     activeColor: Colors.green,
     secondary: Icon(Icons.person),
   ));

   list.add(new RadioListTile(
     value: 3,
     title: new Text("Subjects"),
     groupValue: _selected,
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

  /* final recentSubjects = [
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
  ];*/

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
  return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var totallist = []..addAll(students)..addAll(profs)..addAll(subjects);
    var suggestionList = totallist.where((p) => p.startsWith(query)).toList();
    
    switch (SearchState.getSelectedState()) {
      case 1:
        suggestionList = students.where((p) => p.startsWith(query)).toList();
        break;
      case 2:
        suggestionList = profs.where((p) => p.startsWith(query)).toList();
        break;
      case 3:
        suggestionList = subjects.where((p) => p.startsWith(query)).toList();
        break;
    }

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