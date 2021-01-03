import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_coffee/screens/home/brwTile.dart';
import 'package:flutter_app_coffee/services/auth.dart';
import 'package:flutter_app_coffee/services/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_coffee/models/brew.dart';





class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);
    brews.forEach((e) {
      print('name : ${e.name}');
      print('sugars : ${e.sugars}');
      print('sugars :${e.strength}');
    });
    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index){

        return BrewTile(brew : brews[index]);
      },

    );
  }
}
