import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => new _SearchState();
}

class _SearchState extends State<Search> {
  @override
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";
  List filteredNames = [
  "Lavern Colligan",
  "Bob Coomes",
  "Losonya Dematteo",
  "maryo Kyles",
  "Carisa Watt",
  "Beryl Buchman",
  "Adrianna Aberle",
  "Meagan Kravitz",
  "Janey Parfait",
  "Dayle Reddix",
  "Jinny Kaester",
  "Katherine Ganey",
  "Kendrick Lalley",
  "Marcelle Shaul",
  "Fracie Giffen",
  "Misha Retzlaff",
  ];
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text( 'Search Example' );


  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: _appBarTitle,
        backgroundColor: Theme.of(context).primaryColor,
        actions: <Widget>[
          IconButton(
            icon: _searchIcon,
            onPressed: _searchPressed,
          ),
        ],
      ),
      body: _buildList(),
    );
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search),
              hintText: 'Search...'
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('Search Example');
        _filter.clear();
      }
    });
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: filteredNames.length,
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {source
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
          _searchText = _filter.text;
        });
      }
    });
  }

  void filterText () {
    var i;

     for (i=0; i < filteredNames.length; i++) {
       if (!filteredNames.contains(_searchText))
         filteredNames.removeAt(i);
     }
  }
  }