import 'package:flutter/material.dart';

class User extends StatefulWidget {
  UserState createState() => new UserState();
}

class UserState extends State<User> with SingleTickerProviderStateMixin {

  String nome = "Tiago Filipe Cabral Marques";
  String numAluno = "49879";
  String curso = "MIEEC";
  String periodo = "3º ano";
  String data = "17 de Setembro de 2016";
  String matriculas = "3";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Profile"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            child: new Icon(Icons.person, size: 150.0),
            padding: EdgeInsets.only(bottom: 15.0, top: 10.0),
          ),
          new Container(
            padding: EdgeInsets.only(left: 10.0),
            alignment: Alignment.centerLeft,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text("Nome Completo: ", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                new Text(nome, style: new TextStyle(fontSize: 16.0)),
                new Padding(padding: EdgeInsets.only(bottom: 5.0)),
                new Text("Número de Aluno: ", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                new Text(numAluno, style: new TextStyle(fontSize: 16.0)),
                new Padding(padding: EdgeInsets.only(bottom: 5.0)),
                new Text("Curso: ", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                new Text(curso, style: new TextStyle(fontSize: 16.0)),
                new Padding(padding: EdgeInsets.only(bottom: 5.0)),
                new Text("Período Curricular: ", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                new Text(periodo, style: new TextStyle(fontSize: 16.0)),
                new Padding(padding: EdgeInsets.only(bottom: 5.0)),
                new Text("Data de início: ", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                new Text(data, style: new TextStyle(fontSize: 16.0)),
                new Padding(padding: EdgeInsets.only(bottom: 5.0)),
                new Text("Número de Matrículas: ", style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
                new Text(matriculas, style: new TextStyle(fontSize: 16.0))
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProfile()));
        },
        backgroundColor: Colors.green,
        label: new Text("Update"),
        icon: new Icon(Icons.update),
      )
    );
  }
}

class UpdateProfile extends StatefulWidget {
  UpdateProfileState createState() => new UpdateProfileState();
}

class UpdateProfileState extends State<UpdateProfile> with SingleTickerProviderStateMixin {
  
  final TextEditingController controller = new TextEditingController();
  String result = "";
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Update User Profile"),
        backgroundColor: Colors.green,
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(left: 50.0, right: 50.0),
              child: new TextField(
                decoration: new InputDecoration(
                hintText: "Nome..."
              ),
                onSubmitted: (String str) {
                  setState(() {
                    result = str; 
                  });
                  controller.text = "";
                },
                controller: controller,
              ),
            )
          ],
        ),
      )
    );
  }
}