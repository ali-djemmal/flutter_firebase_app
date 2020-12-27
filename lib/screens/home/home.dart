import 'package:flutter/material.dart';
import 'package:flutter_app_coffee/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home > {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.brown[500],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
               await  _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text("LogOut")
          ),
        ],
      ),
    );
  }
}
