import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class flutterMap extends StatefulWidget {
  @override
  _flutterMapState createState() => _flutterMapState();
}

class _flutterMapState extends State<flutterMap> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: FlutterMap(
        options: MapOptions(center: LatLng(_latitude, _longitde), minZoom: 5.0),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.title.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c']
          ),
          MarkerLayerOptions(markers: [
            Marker(
              width: 45.0,
              height: 45.0,
              point: LatLng(40.71, -74.00),
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
