import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 190, 0, 0),
          child: Column(
            children: <Widget>[
              Icon(Icons.navigation,
                color: Colors.redAccent,
                size: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
