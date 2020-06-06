import 'package:flutter/material.dart';
import 'package:geolocation/geolocation.dart';
import 'package:ambulance/distance_matrix_class.dart';
import 'package:latlong/latlong.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('RastaDo'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('this is home screen'),
            RaisedButton(
              onPressed: (){
              },
              child: Text('location'),

            )
          ],
        ),
      ),
    );
  }
}
