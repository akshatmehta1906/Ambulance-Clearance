import 'package:flutter/material.dart';

class Homee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Column(
          children: <Widget>[
            Center(
              child: Image.asset('tools/meme4.jpeg'),

            ),
            SizedBox(height: 100.0,),
            Text('For more content like ping in the group')
          ],
        ),

    );
  }
}
