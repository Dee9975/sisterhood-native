import 'package:flutter/material.dart';
import 'package:sisterhood/src/screens/calendar.dart';
import 'package:sisterhood/src/screens/intro_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen()
    );
  }
}
