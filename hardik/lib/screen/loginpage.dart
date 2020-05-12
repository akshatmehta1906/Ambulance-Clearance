import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  String email ='';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                    child: Text(
                      'Hello.',
                      style:
                      TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
                Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 5.0, 0.0, 0.0),
                        child: Text(
                          'Welcome Back',
                          style:
                          TextStyle(
                            fontSize: 45.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            Container(
                padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'USERNAME',
                          labelStyle: TextStyle(
                            letterSpacing: 0.8,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                          // hintText: 'EMAIL',
                          // hintStyle: ,
                      ),
                      cursorColor: Colors.white,
                      onChanged: (value){
                        setState(() => email = value );
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'PASSWORD ',
                          labelStyle: TextStyle(
                            letterSpacing: 0.8,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                          ),

                      ),
                      obscureText: true,
                      cursorColor: Colors.white,
                      onChanged: (value){
                        setState(() => password = value );
                      },
                    ),
                    SizedBox(height: 10.0),

                    SizedBox(height: 50.0),

                    Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(2.0),
                          shadowColor: Colors.blueAccent,
                          elevation: 7.0,
                          child: RaisedButton(
                            color: Colors.blue,
                            onPressed: () {
                              print(email);
                              print(password);
                            },
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                    ),

                    SizedBox(height: 20.0),

                    Container(
                      height: 40.0,
                      color: Colors.transparent,
                      child: Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Center(
                            child: Text('Create Account',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                )
                            ),
                          ),


                        ),
                      ),
                    ),
                  ],
                )
            ),
          ]
          ),
        )
    );
  }
}
