import 'dart:io';

import 'package:flutter/material.dart';
import 'package:workout_app/AboutMe.dart';
import 'package:workout_app/Home.dart';

class EndPage extends StatefulWidget {
  @override
  _EndPageState createState() => _EndPageState();
}

class _EndPageState extends State<EndPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 40, right: 40),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(500),
                  ),
                  elevation: 30,
                  child: Image.asset(
                    'assets/completed.png',
                    scale: 1,
                    // height: 200,
                  )
                ),
              ),
              Padding(padding: EdgeInsets.all(15)),
              Text('Congratulations!', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold), textAlign:TextAlign.center,),
              Text('You have completed today\'s workout.', style: TextStyle(fontSize: 25), textAlign:TextAlign.center,),
              Padding(padding: EdgeInsets.all(10)),
              MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
                },
                color: Colors.purple,
                child: Text(
                  'Back to home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  )
                ),
              ),
              MaterialButton(
                onPressed: () => exit(0),
                color: Colors.purple,
                child: Text(
                  'Quit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  )
                ),
              ),
              Padding(padding: EdgeInsets.all(20)),
              IconButton(
                icon: Icon(Icons.info), 
                color: Colors.purple, 
                iconSize: 30,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AboutMe()));
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}