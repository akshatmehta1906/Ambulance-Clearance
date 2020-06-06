import 'package:flutter/material.dart';
import 'package:latlong/latlong.dart';
import 'package:geolocation/geolocation.dart';

class find_Location{

  var location = Location();
  Map<String, double> userLocation;

  userLocation = await location.getLocation();

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
      }
    });
  }

}