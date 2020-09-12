import 'package:flutter/material.dart';
import 'package:sisterhood/src/screens/calendar.dart';
import 'package:supercharged/supercharged.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: "#6A71ED".toColor(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0,bottom: 28.0),
              child: Center(
                  child: Text(
                "Sisterhood",
                style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 54.0),
              height: 225,
              width: 225,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0)
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 14.0, top: 28.0),
              child: Text("Hello Human!", style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 54.0),
              child: Text("This is the app to inspire, motivate and educate you on remarkable people in history.", style: TextStyle(fontSize: 16.0, color: Colors.white),textAlign: TextAlign.center,),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 47.0),
              child: FlatButton(
                child: Container(
                  width: 200.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Center(
                    child: Text(
                      "I am ready!",
                      style: TextStyle(
                          color: "#A4A3AF".toColor(),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onPressed: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Calendar()
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
