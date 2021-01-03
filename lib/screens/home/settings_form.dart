import 'package:flutter/material.dart';
import 'package:flutter_app_coffee/shared/canstants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars =['0','1','2','3','4'];

  String _currentName;
  String _currentSugars;
  String _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key : _formKey,
      child : Column(
        children: <Widget>[
          Text('Update your brew settings',style: TextStyle(fontSize: 18.0),),
          SizedBox(height: 20,),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val)=> val.isEmpty ? 'please enter a name' : null,
            onChanged: (val) => setState(()=> _currentName= val) ,
          ),
          SizedBox(height: 20,),
          DropdownButtonFormField(
              items: sugars.map((e){

              return DropdownMenuItem(child: Text('${e}  sugars'),value: e);
          }).toList(), onChanged: (String value) {print(value);},),
          SizedBox(height: 20,),
          //hgfhgfhgfhgfhg
          RaisedButton(onPressed: () async{
            print(_currentName);
            print(_currentStrength);
            print(_currentSugars);
          },
            color: Colors.brown[400],
            child: Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      )


    );
  }
}
