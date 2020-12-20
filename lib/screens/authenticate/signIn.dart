import 'package:flutter/material.dart';
import 'package:flutter_app_coffee/services/auth.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}
class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: Text('Sign In to Coffee App'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child: RaisedButton(onPressed: () async{
          dynamic result = await _auth.signInAnon();
          if(result == null){
            print("error sign in");

          }else{
            print("sign in");
            print(result.uid);

          }

        },
        child: Text('Sign in Anon'),
        ),
      ),
    );
  }
}
