import 'package:flutter/material.dart';
import 'package:flutter_app_coffee/screens/authenticate/signIn.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate > {
  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}
