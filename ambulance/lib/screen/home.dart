import 'package:flutter/material.dart';
import 'package:geolocation/geolocation.dart';
import 'package:ambulance/distance_matrix_class.dart';
import 'package:latlong/latlong.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  getPermission() async{
    final GeolocationResult result =
        await Geolocation.requestLocationPermission(permission: const LocationPermission(
          android: LocationPermissionAndroid.fine,
          ios: LocationPermissionIOS.always
        ));
    return result;
  }
  getLocation(){
    return getPermission().then((result) async{
      if(result.isSuccessful){
        final coords =
        await Geolocation.currentLocation(accuracy: LocationAccuracy.best);
        print(coords);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('RastaDo'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('this is home screen'),
            RaisedButton(
              onPressed: (){
                getLocation ();
              },
              child: Text('location'),

            )
          ],
        ),
      ),
    );
  }
}
