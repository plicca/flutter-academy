import 'package:clip/config/variables.dart';
import 'package:clip/login_page_display.dart';
import 'package:clip/overview_display.dart';
import 'package:clip/search_page.dart';
import 'package:clip/schedule_display.dart';
import 'package:clip/splash.dart';
import 'package:clip/subjects_display.dart';
import 'package:clip/user_profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: Tabs(), routes: <String, WidgetBuilder>{
    "/Tabs": (BuildContext context) => new Tabs(),
    "/SplashScreen": (BuildContext context) => new SplashScreen(),
    "/LoginPage": (BuildContext context) => new LoginPage(),
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
    if(IS_STUDENT){
      USER_COLOR = Colors.green;
    } else {
      USER_COLOR = Colors.blue;
    }
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<Widget> overviewDisplay() {
    if(IS_STUDENT){
      return [
        new ListTile(
          trailing: new Icon(Icons.assignment_turned_in, color: USER_COLOR),
          title: Text("Resumo", style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: USER_COLOR)),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Overview()));
          },
        ),
        new Divider(
          color: USER_COLOR
        ),
      ];
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("MyCLIP", style: new TextStyle(fontSize: 22.5)),
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.attach_file, size: 30.0),
            onPressed: () {
              setState(() {
               if(IS_STUDENT){
                 IS_STUDENT = false;
                 USER_COLOR = Colors.blue;
               } else {
                 IS_STUDENT = true;
                 USER_COLOR = Colors.green;
               }
              });
            },
          ),
          new Padding(padding: EdgeInsets.only(right: 5.0))
        ],
        backgroundColor: USER_COLOR,
      ),
      bottomNavigationBar: new Material(
        color: USER_COLOR,
        child: new TabBar(
          indicatorColor: Colors.white,
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
        children: <Widget>[new Subjects(), new Search(), new UserProfile()],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              decoration: new BoxDecoration(
                color: USER_COLOR
              ),
              accountName: new Text("Tiago Marques"),
              accountEmail: new Text("tf.marques@campus.fct.unl.pt"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text("T", style: new TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: USER_COLOR)),
              ),
            ),
            new ListTile(
              trailing: new Icon(Icons.schedule, color: USER_COLOR),
              title: Text("Horário", style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: USER_COLOR)),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ScheduleDisplay()));
              },
            ),
            new Divider(
              color: USER_COLOR,
            ),
            new ListTile(
              trailing: new Icon(Icons.calendar_today, color: USER_COLOR),
              title: Text("Calendário", style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: USER_COLOR)),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            new Divider(
              color: USER_COLOR
            ),
          ] + overviewDisplay()
        ),
      ),
    );
  }
}
