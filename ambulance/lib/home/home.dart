import 'package:ambulance/home/setting_form.dart';
import 'package:ambulance/models/amb.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ambulance/services/auth.dart';
import 'package:ambulance/services/database.dart';
import 'package:provider/provider.dart';
import 'package:ambulance/home/user_list.dart';
import 'package:ambulance/map/flutter_maps.dart';


class Home extends StatefulWidget {



  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final AuthService _auth= AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('RastaDo'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        actions: <Widget>[
          FlatButton.icon(
              onPressed:  () async{
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Logout')
          ),
        ],

      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
          child: Column(
            children: <Widget>[
              Text('Go to maps', style: TextStyle(color: Colors.white),),
              SizedBox(height: 10.0,),
              RaisedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>flutterMap()));
                },
                child: Text('location'),
              ),
              SizedBox(height: 30.0,),
              Text('Get Location', style: TextStyle(color: Colors.white),),
              SizedBox(height: 10.0,),
              RaisedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>GeolocationExample()));
                },
                child: Text('Coordinates'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}














class GeolocationExampleState extends State {
  Geolocator _geolocator;
  Position _position;

  void checkPermission() {
    _geolocator.checkGeolocationPermissionStatus().then((status) { print('status: $status'); });
    _geolocator.checkGeolocationPermissionStatus(locationPermission: GeolocationPermission.locationAlways).then((status) { print('always status: $status'); });
    _geolocator.checkGeolocationPermissionStatus(locationPermission: GeolocationPermission.locationWhenInUse)..then((status) { print('whenInUse status: $status'); });
  }


  @override
  void initState() {
    super.initState();

    _geolocator = Geolocator();
    LocationOptions locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 1);

    checkPermission();
      updateLocation();

    StreamSubscription positionStream = _geolocator.getPositionStream(locationOptions).listen(
            (Position position) {
          _position = position;
        });
  }

  void updateLocation() async {
    try {
      Position newPosition = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
          .timeout(new Duration(seconds: 5));

      setState(() {
        _position = newPosition;
      });
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coordinates'),
      ),
      body: Center(
          child: Text(
              'Latitude: ${_position != null ? _position.latitude.toString() : '0'},'
                  ' Longitude: ${_position != null ? _position.longitude.toString() : '0'}'
          )
      ),
    );
  }
}


class GeolocationExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GeolocationExampleState();
  }}
