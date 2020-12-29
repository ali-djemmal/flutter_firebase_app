import 'package:flutter/material.dart';
import 'package:flutter_app_coffee/screens/authenticate/register.dart';
import 'package:flutter_app_coffee/screens/authenticate/signIn.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate > {
  bool showSingIn = true;
  void toggleView()=> setState(() {showSingIn=!showSingIn;});

  @override
  Widget build(BuildContext context) {
     if(showSingIn){
       return  SignIn(toggleView : toggleView);
    }else{
       return Register(toggleView : toggleView) ;

    }



  }
}
