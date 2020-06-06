import 'package:flutter/material.dart';
import 'package:geolocation/geolocation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: flutter_maps(),
    );
  }
}


class flutter_maps extends StatefulWidget {
  @override
  _flutter_mapsState createState() => _flutter_mapsState();
}

class _flutter_mapsState extends State<flutter_maps> {

  MapController controller = MapController();


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
  buildMap(){
    return getLocation().then((response){
      if(response.isSuccessful){
        response.listen((value){
          controller.move(LatLng(value.location.latitude, value.location.longitude),
              15.0);
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geolocation'),
        backgroundColor: Colors.grey[800],
      ),
      body: FlutterMap(
        mapController: controller,
        options: MapOptions(center: buildMap(), minZoom:  5.0),
        layers: [
          TileLayerOptions(
            urlTemplate:
              "https://{s}.title.openstreetmap.org/{z}/{x}/{y}.png",
          ),
          MarkerLayerOptions(markers: [
            Marker(
              width: 45.0,
              height: 45.0,
              point: LatLng(getLocation().then(response){response.listen((value){value.location.latitude});}, getLocation().then(response){response.listen((value){value.location.longitude});}),
              builder: (context) => Container(
                child: IconButton(icon: Icons.location_on, onPressed: null, color: Colors.red,iconSize: 45.0),
              )
            )
          ])
        ],
      ),
    );
  }
}
