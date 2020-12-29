import 'package:flutter/material.dart';
import 'package:flutter_app_coffee/services/auth.dart';


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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF532E1C))
                  )
                ),
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
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF532E1C))
                    )
                ),
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
                dynamic result = await _auth.signInAnon();
                if(result == null){

                  print("error sign in");

                }else{
                  print(email);
                  print("sign in");
                  print(result.uid);

                }

              },
                color:  Color(0xFF532E1C),
                child: Text('sign in',style: TextStyle(color:Colors.white)),
              ),
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