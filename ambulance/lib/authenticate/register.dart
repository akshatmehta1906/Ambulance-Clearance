import 'package:ambulance/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:ambulance/services/auth.dart';
import 'package:ambulance/shared/constants.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});


  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth=AuthService();
  final _formKey=GlobalKey<FormState>();
  bool loading=false;

  //text field state
  String email='';
  String password='';
  String error='';

  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Register'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                TextFormField(
                  decoration: textInputDecorations.copyWith(hintText: 'Email'),
                    validator: (val)=> val.isEmpty ? 'Enter an Email': null ,
                    onChanged: (val)
                    {
                      setState(()=>email=val);
                    }
                ),

                SizedBox(height: 20),
                TextFormField(
                  decoration: textInputDecorations.copyWith(hintText: 'Password'),
                  validator: (val)=> val.length<6 ? 'Enter a password of more than 6 characters': null ,
                  obscureText: true,
                  onChanged: (val)
                  {
                    setState(()=>password=val);
                  },
                ),

                SizedBox(height: 20),
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text('Register',
                      style: TextStyle(color: Colors.white)),
                  onPressed: () async{
                    setState(() => loading=true );
                    if(_formKey.currentState.validate())
                      {
                        dynamic result=await _auth.registerWithEmailandPassword(email, password);
                        if(result==null)
                          {
                            setState((){
                              error='Please supply a valid Email';
                              loading=false;
                          });

                            }
                          }
                      }
                ),

                SizedBox(height:20),
                Text(error, style: TextStyle(color: Colors.red, fontSize: 14)),

              ],
          ),
        ),
      ),
    );
  }
}