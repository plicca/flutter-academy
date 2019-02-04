import 'package:flutter/material.dart';

import 'searchpage.dart' as search;
import 'studentpage.dart' as user;
import 'coursespage.dart' as subjects;

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
        title: new Text("CLIP"),
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
          new subjects.CoursesHome(),
          new search.Search(),
          new user.StudentHome()
        ],
      ),
    );
  }
}