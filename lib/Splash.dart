import 'dart:async';

import 'package:flutter/material.dart';

import 'Home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool large = false;
  Timer timer;
  // int count = 0;

  animationControl() {
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        large = !large;
      });
    });
  }

  toHome() {
    timer.cancel();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  void initState() {
    animationControl();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              onEnd: () {
      toHome();},
              duration: Duration(seconds: 1),
              height: large ? 400 : 200,
              width: large ? 400 : 200,
              curve: Curves.easeOutCubic,
              child: Image.asset('assets/LCO WORKOUT LOGO transparent copy.png', fit: BoxFit.cover,),
            )
          ],
        ),
      )
    );
  }
}