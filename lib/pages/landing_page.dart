import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: Colors.red,
            child: Text('chuvod.dolyhood'),
          )),
          Expanded(
              child: Container(
            color: Colors.yellow,
          )),
          Expanded(
              child: Container(
            color: Colors.blue,
          ))
        ],
      ),
    );
  }
}
