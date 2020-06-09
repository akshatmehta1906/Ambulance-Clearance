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
import 'package:ambulance/home/latlong.dart';

int lat=0;
int long=0;




class Home extends StatelessWidget {

  final AuthService _auth= AuthService();
  Position _position;




  @override
  Widget build(BuildContext context) {

    GeolocationExample();

    return StreamProvider<List<Amb>>.value(
      value: DatabaseService().users,


      child: Scaffold(



        body:
        Center(
            child: Text(
                'Latitude: a'
                    ' Longitude: b'
            )
        ),
      )

    );
  }
}
