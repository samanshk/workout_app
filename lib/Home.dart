import 'package:flutter/material.dart';
import 'package:workout_app/SchedulePage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('LCO Home Workout'),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 150,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Card(
                                color: Colors.purple,
                                elevation: 20,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Container(
                                  height: 100,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset('assets/cropped_logo.png', height: 150), 
                            color: Colors.white,
                            elevation: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SchedulePage('random')));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 10,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            // color: Colors.red,
                            padding: EdgeInsets.all(10),                
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Image.asset('assets/benchpress.png', height: 100),
                                    Image.asset('assets/pushups.png', height: 100)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Image.asset('assets/bicep_curl.png', height: 100,),
                                    Image.asset('assets/tree_pose.png', height: 100)
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:  Color.fromRGBO(0, 0, 0, 0.5),
                            ),
                            // height: double.maxFinite,
                            width: double.maxFinite,
                            child: Container(
                              child: null, 
                              height: 220
                            ),
                          ),
                          Center(
                            heightFactor: 5,
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Card(
                                  color: Colors.transparent,
                                  elevation: 20,
                                  child: Text(
                                    'RANDOM',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SchedulePage('days')));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 7,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            // color: Colors.red,
                            padding: EdgeInsets.all(10),                
                            child: Center(
                              heightFactor: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Image.asset('assets/seated_cable_row.png', height: 100),
                                  Image.asset('assets/crunches.png', height: 100),
                                  Image.asset('assets/forward_bend.png', height: 100,),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color:  Color.fromRGBO(0, 0, 0, 0.5),
                            ),
                            // height: double.maxFinite,
                            width: double.maxFinite,
                            child: Container(
                              child: null, 
                              height: 220
                            ),
                          ),
                          Center(
                            heightFactor: 5,
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Card(
                                  color: Colors.transparent,
                                  elevation: 20,
                                  child: Text(
                                    'DAY WISE',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(7)),
                ],
              ),
          ),
          ),
      ),
    );
  }
}