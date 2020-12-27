import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_coffee/models/user.dart';
import 'package:flutter_app_coffee/screens/wrapper.dart';
import 'package:flutter_app_coffee/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(
    StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
       home: Wrapper(),
),
    ));
