import 'package:ambulance/models/amb.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ambulance/services/auth.dart';
import 'package:ambulance/services/database.dart';
import 'package:provider/provider.dart';
import 'package:ambulance/map/flutter_maps.dart';
import 'package:ambulance/shared/constants.dart';
import 'package:ambulance/shared/loading.dart';
import 'package:ambulance/models/user.dart';


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
                child: Text('Location'),
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
  final _formKey = GlobalKey<FormState>();
  Geolocator _geolocator;
  Position _position;
  double _lat;
  double _long;


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

    // StreamSubscription positionStream = _geolocator.getPositionStream(locationOptions).listen(
    //       (Position position) {
    //    _position = position;
    //    });
  }

<<<<<<< Updated upstream
  void updateLocation() async {
=======
  void
  updateLocation() async {
    print("updating ...");
>>>>>>> Stashed changes
    try {
      Position newPosition = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
          .timeout(new Duration(seconds: 5));

      setState(() {
        _position = newPosition;
      });
<<<<<<< Updated upstream
=======
//      await DatabaseService(uid: "XbyZRbkk4jUfgppZzCacALcgAiH3").updateUserData(
//        'asdfgh ' ?? userData.name,
//        _lat ?? userData.latitude,
//        _long ?? userData.longitude,
//      );
        Firestore.instance.collection("ID").document("789IsAs3uthnB0Re1oZS9jpQ0Gz2").updateData({
        'longitude': _position.longitude.toDouble(),
        'latitude': _position.latitude.toDouble(),
      });
>>>>>>> Stashed changes
    } catch (e) {
      print('Error: ${e.toString()}');
    }

    _lat=_position.latitude.toDouble();
    _long=_position.longitude.toDouble();

    final user= Provider.of<User>(context);
    DatabaseService(uid: user.uid).userData;
    key: _formKey;
    //UserData userData=snapshot.data;

    // DatabaseService(uid: user.uid).updateUserData(
    //     ' '?? userData.name,
    //     _lat?? userData.latitude,
    //     _long?? userData.longitude,);

    StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,



        builder: (context, snapshot) {
          UserData userData = snapshot.data;
          DatabaseService(uid: user.uid).updateUserData(
              ' ' ?? userData.name,
              _lat ?? userData.latitude,
              _long ?? userData.longitude
          );
        }
    );

  }

  @override
  Widget build(BuildContext context) {

    final user= Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,



        builder: (context, snapshot)
        {


          UserData userData=snapshot.data;
          return Scaffold
            (
            appBar: AppBar(
              title: Text('Coordinates'),
            ),
            key: _formKey,
            body:SafeArea(

              child:Column
                (

                children: <Widget>[

                  Text(
                      'Latitude: ${_position != null
                          ? _position.latitude.toString()
                          : '0'},'
                          ' Longitude: ${_position != null ? _position.longitude
                          .toString() : '0'}'


                  ),




                  RaisedButton(
                    color: Colors.pink,
                    child: Text(
                      'Back',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async{

                      {
                        await DatabaseService(uid: user.uid).updateUserData(
                          ' '?? userData.name,
                          _lat?? userData.latitude,
                          _long?? userData.longitude,
                        );
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          );

        }
    );




  }






}


class GeolocationExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GeolocationExampleState();
  }}

