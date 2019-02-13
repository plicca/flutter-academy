import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => new _LoginPage();
}

class _LoginPage extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Widget build (BuildContext context) {
    final logo = new Container (
      child: CircleAvatar(
        backgroundColor: Colors.green,
        radius: 48.0,
        child: Icon(Icons.attach_file, size: 50.0,),
        //add image logo
      ),
    );
    final email = TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        ),
      ),
    );
    final password = TextFormField(
      controller: passwordController,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0)
        ),
      ),
    );
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.green.shade50,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 280.0,
          height: 42.0,
          onPressed: () {
            //ADD AUTH request
          },
          child: Text('Log In', style: TextStyle(color: Colors.green, fontSize: 16.0),),
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0,),
            email,
            SizedBox(height: 20.0,),
            password,
            SizedBox(height: 48.0,),
            loginButton,
          ],
        ),
      ),
    );
  }
}