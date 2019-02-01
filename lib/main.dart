import 'package:flutter/material.dart';
import './search_page.dart' as search;
import './subjects_display.dart' as subjects;
import './user_profile.dart' as user;


void main() {
  runApp(new MaterialApp(
    home: Tabs()
  ));
}

class Tabs extends StatefulWidget {
  @override
  TabsState createState() => new TabsState();
}

class TabsState extends State<Tabs> with SingleTickerProviderStateMixin {
  
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }
  
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("CLIP v.0.1"),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: new Material(
        color: Colors.green,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.assignment)),
            new Tab(icon: new Icon(Icons.search)),
            new Tab(icon: new Icon(Icons.person))
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new subjects.Subjects(),
          new search.Search(),
          new user.User()
        ],
      ),
    );
  }
}