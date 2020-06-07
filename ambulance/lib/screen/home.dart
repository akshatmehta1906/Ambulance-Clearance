import 'package:flutter/material.dart';
import 'package:geolocation/geolocation.dart';
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
          child: Column(
            children: <Widget>[
              Text('this is home screen', style: TextStyle(color: Colors.white),),
              SizedBox(height: 10.0,),
              RaisedButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/flutter_Map');
                },
                child: Text('location'),
              )
            ],
          ),
        ),
      ),
    );
  }
}


