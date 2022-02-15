import 'package:englishcard/pages/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Hide status bar
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      home: LandingPage(),
    );
  }
}
