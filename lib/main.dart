import 'package:clip/search_page.dart';
import 'package:clip/splash.dart';
import 'package:clip/subjects_display.dart';
import 'package:clip/user_profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: Tabs(), routes: <String, WidgetBuilder>{
    "/Tabs": (BuildContext context) => new Tabs(),
    "/SplashScreen": (BuildContext context) => new SplashScreen()
  }));
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
        title: new Text("MyCLIP", style: new TextStyle(fontSize: 22.5)),
        actions: <Widget>[new Icon(Icons.attach_file, size: 30.0), new Padding(padding: EdgeInsets.only(right: 10.0))],
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: new Material(
        color: Colors.green,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.assignment), text: "Subjects"),
            new Tab(icon: new Icon(Icons.search), text: "Search"),
            new Tab(icon: new Icon(Icons.person), text: "Profile"),
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[new Subjects(), new Search(), new User()],
      ),
    );
  }
}
