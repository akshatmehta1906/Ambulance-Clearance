import 'package:ambulance/home/setting_form.dart';
import 'package:ambulance/models/amb.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ambulance/services/auth.dart';
import 'package:ambulance/services/database.dart';
import 'package:provider/provider.dart';
import 'package:ambulance/home/user_list.dart';


class Home extends StatelessWidget {

  final AuthService _auth= AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel()
    {
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal:60 ),
          child: SettingsForm(),
        );
      } );
    }


    return StreamProvider<List<Amb>>.value(
      value: DatabaseService().users,

      child: Scaffold(
            backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Ambulance Clearance'),
          backgroundColor: Colors.brown[400],
          elevation: 0,
          actions: <Widget>[
            FlatButton.icon(
                onPressed:  () async{
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text('Logout')
            ),
            FlatButton.icon(
                onPressed: ()=> _showSettingsPanel(),
                icon: Icon(Icons.settings),
                label: Text('Settings')
            ),
          ],
        ),
        body: UserList(),
      ),
    );
  }
}
