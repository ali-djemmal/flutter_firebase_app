import 'package:flutter/material.dart';
import 'package:flutter_app_coffee/models/user.dart';
import 'package:flutter_app_coffee/screens/authenticate/authenticate.dart';
import 'package:flutter_app_coffee/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print("c,bncbncbncbncbnbcnbcnb");
    return  user == null ?  Authenticate() :  Home();
  }
}
