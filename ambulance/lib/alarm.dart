import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:ambulance/models/amb.dart';
import 'package:ambulance/services/auth.dart';
import 'package:ambulance/services/database.dart';
import 'package:provider/provider.dart';
import 'package:ambulance/map/flutter_maps.dart';
import 'package:ambulance/shared/constants.dart';
import 'package:ambulance/models/user.dart';


void main() => runApp(Alarm());

class Alarm extends StatefulWidget {
  @override
  _AlarmState createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {

  AssetsAudioPlayer _assetsAudioPlayer;
  final _formKey = GlobalKey<FormState>();
  Geolocator _geolocator;
  Position _position;
  double _lat;
  double _long;
  String _name = "no name";
  Timer _timer;

  void checkPermission() {
    _geolocator.checkGeolocationPermissionStatus().then((status) {
      print('status: $status');
    });
    _geolocator
        .checkGeolocationPermissionStatus(
        locationPermission: GeolocationPermission.locationAlways)
        .then((status) {
      print('always status: $status');
    });
    _geolocator.checkGeolocationPermissionStatus(
        locationPermission: GeolocationPermission.locationWhenInUse)
      ..then((status) {
        print('whenInUse status: $status');
      });
  }


  @override
  void initState() {

    _assetsAudioPlayer = AssetsAudioPlayer();
    _assetsAudioPlayer.open(Audio("assets/song1.mp3"),);
    super.initState();



    _geolocator = Geolocator();
    LocationOptions locationOptions =
    LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 1);

    checkPermission();
    updateLocation();

    _timer = Timer.periodic(Duration(seconds: 3), (Timer t) =>
        updateLocation()
    );

  }



  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

  void updateLocation() async {
    print("updating ...");
    try {
      Position newPosition = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
          .timeout(new Duration(seconds: 5));

      setState(() {
        _position = newPosition;
      });

      Firestore.instance.collection("ID").document("789IsAs3uthnB0Re1oZS9jpQ0Gz2").updateData({
        'longitude': _position.longitude.toDouble(),
        'latitude': _position.latitude.toDouble(),
      });
    } catch (e) {
      print('Error: ${e.toString()}');
    }

    _lat = _position.latitude.toDouble();
    _long = _position.longitude.toDouble();

    final user = Provider.of<User>(context);
    DatabaseService(uid: user.uid).userData;
    key:
    _formKey;



  }





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: const Text('Asset Audio Example'),
        ),
        body: Container(),
      ),
    );
  }
}