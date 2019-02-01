import 'package:flutter/material.dart';

class User extends StatefulWidget {
  UserState createState() => new UserState();
}

class UserState extends State<User> with SingleTickerProviderStateMixin {
  String nome = "Pedro Miguel Silvério de Oliveira";
  String numAluno = "50544";
  String curso = "MIEEC";
  String periodo = "3.º ano";
  String data = "17 de Setembro de 2016";
  String matriculas = "3";

  void onPressed() {  }  @override

  Widget build(BuildContext context) {
      return ListView(
        children: [
          new Column(
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
                    new Text("Nome Completo: ", style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0)),
                    new Text(nome),
                    new Padding(padding: EdgeInsets.only(bottom: 5.0)),
                    new Text("Número de Aluno: ", style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0)),
                    new Text(numAluno),
                    new Padding(padding: EdgeInsets.only(bottom: 5.0)),
                    new Text("Curso: ", style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0)),
                    new Text(curso),
                    new Padding(padding: EdgeInsets.only(bottom: 5.0)),
                    new Text("Período Curricular: ", style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0)),
                    new Text(periodo),
                    new Padding(padding: EdgeInsets.only(bottom: 5.0)),
                    new Text("Data de início: ", style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0)),
                    new Text(data),
                    new Padding(padding: EdgeInsets.only(bottom: 5.0)),
                    new Text("Número de Matrículas: ", style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0)),
                    new Text(matriculas)
                  ],
                ),
              ),
              new Container(
                padding: EdgeInsets.only(top: 25.0),
                child: new Center(
                  child: new RaisedButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    child: new Text(
                        "Update", style: new TextStyle(color: Colors.white)),
                    color: Colors.green,
                    onPressed: onPressed,
                  ),
                ),
              )
            ],
          )
        ]
    );
  }
}