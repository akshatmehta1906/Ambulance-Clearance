import 'package:ambulance/flutter_maps.dart';
import 'package:flutter/material.dart';
import 'package:ambulance/screen/home.dart';
import 'package:ambulance/screen/loading.dart';
import 'package:ambulance/screen/loginpage.dart';
import 'package:ambulance/screen/checkin.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/' : (context) => Loading(),
    '/checkin_page' : (context) => Choose(),
    '/login' : (context) => login(),
    '/home' : (context) => Home(),
    '/flutter_Map': (context) => flutterMap(),
  },
));