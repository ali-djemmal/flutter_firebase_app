import 'package:flutter/material.dart';
import 'package:flutter_app_coffee/services/auth.dart';
import 'package:flutter_app_coffee/shared/canstants.dart';
import 'package:flutter_app_coffee/shared/loading.dart';


class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}
class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  // text field state
  String email="";
  String password="";
  String error="";
  final  _formKey = GlobalKey<FormState>();
  bool loading = false;


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Color(0xFFE6E6E6),
      appBar: AppBar(
        backgroundColor:Color(0xFFC5A880),
        title: Text('Sign In to Coffee App'),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: ()  {
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text("Register")
          ),
        ],
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),

        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (val)=> val.isEmpty ? 'Enter an email' : null,
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                cursorColor: Color(0xFF532E1C),
                onChanged: (val){
                  setState(() {
                    email= val;
                  });

                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                validator: (val)=> val.length < 6 ? 'Enter a password +6 chars long' : null,
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                cursorColor: Color(0xFF532E1C),
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    email= val;
                  });


                },
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(onPressed: () async {
                if(_formKey.currentState.validate()){
                  setState(() {
                    loading = true;
                  });

                  dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                  if(result== null){
                    setState(() {
                      loading = false;
                      error="the crendentials error";
                    });
                  }



                }else{
                  print("inpute not valid");
                }



              },
                color:  Color(0xFF532E1C),
                child: Text('Sign In',style: TextStyle(color:Colors.white)),
              ),
              SizedBox(height: 12.0,),
              Text(error,
                style: TextStyle(color: Colors.red,fontSize: 14.0),)
            ],

          ),
        ),
      ),
    );
  }
}

/*Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
        child: RaisedButton(onPressed: () async {
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
      ),*/