import 'package:flutter/material.dart';

class Choose extends StatefulWidget {
  @override
  _ChooseState createState() => _ChooseState();
}

class _ChooseState extends State<Choose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text('RastaDo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Ambulance'),
              onPressed: (){
                Navigator.pushNamed(context, '/login');
              },
              color: Colors.deepOrangeAccent,
            ),
            SizedBox(height: 20.0,),
            RaisedButton(
              child: Text('Cars'),
              onPressed: (){
                Navigator.pushNamed(context, '/login');
              },
              color: Colors.deepOrangeAccent,
            )
          ],
        ),
      ),
    );
  }
}
