import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class flutterMap extends StatefulWidget {
  @override
  _flutterMapState createState() => _flutterMapState();
}

class _flutterMapState extends State<flutterMap> {

  double _latitude = 40.71;
  double _longitude = -74.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: FlutterMap(
        options: MapOptions(center: LatLng(_latitude, _longitude), minZoom: 5.0),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://www.openstreetmap.org/",
            subdomains: ['a', 'b', 'c']
          ),
          MarkerLayerOptions(markers: [
            Marker(
              width: 45.0,
              height: 45.0,
              point: LatLng(_latitude, _longitude),
              builder: (context) => Container(
                child: IconButton(icon: Icon(Icons.location_on), onPressed: null, color: Colors.red,),
              )
            )
          ]),
        ],
      ),
    );
  }
}
