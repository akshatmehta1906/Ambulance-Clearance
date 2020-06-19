import 'package:flutter/material.dart';
import 'package:ambulance/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:ambulance/models/user.dart';
import 'package:ambulance/home/home.dart';
import 'package:ambulance/wrapper/fun.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user= Provider.of<User>(context);


    //return either home or authenticate widget
    if(user==null)
      {
        return Homee();
      }
    else
      {
        return Homee();
      }
  }
}
