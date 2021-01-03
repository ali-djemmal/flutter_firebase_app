import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_coffee/models/brew.dart';
import 'package:flutter_app_coffee/screens/home/brew_list.dart';
import 'package:flutter_app_coffee/screens/home/settings_form.dart';
import 'package:flutter_app_coffee/services/auth.dart';
import 'package:flutter_app_coffee/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home > {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {


    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }


    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Color(0xFFE6E6E6),
        appBar: AppBar(
          backgroundColor:Color(0xFFC5A880),
          title: Text('Home'),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () async {
                 await  _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text("LogOut"),
            ),
            FlatButton.icon(
              onPressed: ()=> _showSettingsPanel(),
              icon: Icon(Icons.settings),
              label: Text("Settings"),
            ),

          ],
        ),
        body: BrewList(),
      ),
    );
  }
}



