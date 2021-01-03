import 'package:flutter/material.dart';
import 'package:flutter_app_coffee/services/auth.dart';
import 'package:flutter_app_coffee/shared/canstants.dart';
import 'package:flutter_app_coffee/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  // text field state
  String email = "";
  String password = "";
  String error = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Color(0xFFE6E6E6),
      appBar: AppBar(
        backgroundColor: Color(0xFFC5A880),
        title: Text('Register'),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text("Sign in")),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                cursorColor: Color(0xFF532E1C),
                onChanged: (val) => setState(() {
                  print(val);
                  email = val;
                }),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (val) =>
                    val.length < 6 ? 'Enter a password +6 chars long' : null,
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                cursorColor: Color(0xFF532E1C),
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      loading = true;
                    });
                    print(email);
                    dynamic result = await _auth.registerWithEmailAndPassword(
                        email, password);
                    if (result == null) {
                      setState(() {
                        loading = false;
                        error = "please entre a valide email";
                      });
                    }
                  } else {
                    print("inpute not valid");
                  }
                },
                color: Color(0xFF532E1C),
                child: Text('Register', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(
                height: 12.0,
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
