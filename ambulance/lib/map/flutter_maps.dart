import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'dart:async';

class flutterMap extends StatefulWidget {
  @override
  _flutterMapState createState() => _flutterMapState();
}

class _flutterMapState extends State<flutterMap> {

  double _latitude = 19.1334;
  double _longitude = 72.9133;
  MapController controller = MapController();
  MapOptions options = MapOptions(center: LatLng(19.2334, 72.9133), minZoom: 15.0);
  Timer _timer;

  buildMap(){
    _latitude += 0.0001;
    controller.move(LatLng(_latitude, _longitude), 5.0);
    return;
  }

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) =>
        buildMap()
    );

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      body: FlutterMap(
        mapController: controller,
        options: options,
        layers: [
          TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']
          ),
          MarkerLayerOptions(markers: [
            Marker(
                point: LatLng(19.1334, 72.9133),
                builder: (context) => Container(
                  child: IconButton(icon: Icon(Icons.location_on, color: Colors.red,), onPressed: null,  iconSize: 45.0,),
                )
            ), Marker(
                point: LatLng(19.1384, 72.9133),
                builder: (context) => Container(
                  child: IconButton(icon: Icon(Icons.location_on, color: Colors.blue,), onPressed: null,  iconSize: 45.0,),
                )
            )
          ], ),
        ],
      ),
    );
  }
}
