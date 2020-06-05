import 'package:flutter/material.dart';
import 'package:geolocation/geolocation.dart';
import 'package:ambulance/distance_matrix_class.dart';

void main() async {
  runApp(new MyApp(
    distanceMatrix: await DistanceMatrix.loadData(),
  ));
}

class MyApp extends StatefulWidget {
  final DistanceMatrix distanceMatrix;

  @override
  _MyAppState createState() => new _MyAppState();

  MyApp({this.distanceMatrix});
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Home"),
            ),
            body: Material(
                child: ListView.builder(
                  itemCount: widget.distanceMatrix.elements.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      title: Text(widget.distanceMatrix.elements[index].distance.text),
                      subtitle: Text(widget.distanceMatrix.elements[index].distance.value.toString()),
                    );
                  },
                )
            )));
  }
}