import 'package:clip/networking/teacher_endpoint.dart';
import 'package:flutter/material.dart';
import './search_page.dart' as search;
import './subjects_display.dart' as subjects;
import './user_profile.dart' as user;
import './splash.dart' as splash;

void main() {
  runApp(new MaterialApp(
      home: splash.SplashScreen(),
      routes: <String, WidgetBuilder> {
        "/Tabs": (BuildContext context) => new Tabs()
      }
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
        actions: <Widget>[
          new Icon(Icons.attach_file, size: 30.0),
          new Padding(padding: EdgeInsets.only(right: 10.0))
        ],
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: new Material(
        color: Colors.green,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.assignment)),
            new Tab(icon: new Icon(Icons.search)),
            new Tab(icon: new Icon(Icons.person)),
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget> [
          new subjects.Subjects(),
          new search.Search(),
          new user.User(),
        ],
      ),
    );
  }
}