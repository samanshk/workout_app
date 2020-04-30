import 'dart:math';

import 'package:flutter/material.dart';
import 'ExercisePage.dart';
import 'exercises.dart';

class SchedulePage extends StatefulWidget {
  String type;
  SchedulePage(this.type);
  @override
  _SchedulePageState createState() => _SchedulePageState(type);
}

class _SchedulePageState extends State<SchedulePage> {
  String type;
  _SchedulePageState(this.type);
  double duration = 0;
  List ex = [];
  String head = "Today's";
  int sets = 1;

  durationCalc() {
    setState(() {
      duration = 0;
      ex.forEach((e) {duration += e['seconds'];});
      duration += 200;
      duration *= sets;
    });
  }

  @override
  void initState() {
    if (type == 'days') {
      int today = DateTime.now().weekday;
      int n =  (today - 1) * 2;
      for (int i = n; i < n + 5; i++) {
        setState(() {
          ex.add(exercises[i%14]);
        });  
      } 

      setState(() {
        switch (today) {
          case 1:
            head = 'Monday';
            break;
          case 2:
            head = 'Tuesday';
            break;
          case 3:
            head = 'Wednesday';
            break;
          case 4:
            head = 'Thursday';
            break;
          case 5:
            head = 'Friday';
            break;
          case 6:
            head = 'Saturday';
            break;
          case 7:
            head = 'Sunday';
            break;
          default:
        }
      });     
    }

    else if (type == 'random') {
      while (ex.length < 5) {
        int rand = Random().nextInt(14);
        if (!ex.contains(rand)) {
          setState(() {
            ex.add(rand);
          });          
        }
      }
      setState(() {
        ex = ex.map((n) => exercises[n]).toList();
      });      
    }
    
    durationCalc();
    print(ex);
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(head + ' Workout'),),
      body: Container(
        padding: EdgeInsets.only(left: 3, right: 3),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/cropped_logo.png', fit: BoxFit.cover,),
              ],
            ),
            Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, i) {
                      // i = (i + DateTime.now().weekday + 1) % 13;
                      // i = (i + 2 + 1) % 13;
                      
                      return Padding(
                        padding: const EdgeInsets.only(top: 5, ),
                        child: Container(
                          margin: (i == 4) ? EdgeInsets.only(bottom: 70) : EdgeInsets.all(0),
                          child: Card(
                            color: Color.fromRGBO(255, 255, 255, 0.9),
                            // color: Color.fromRGBO(0, 0, 0, 0.4),
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(width: 2, color: Color.fromRGBO(0, 0, 0, 0.4))
                            ),
                            child: Column(
                              children: <Widget>[
                                Padding(padding: EdgeInsets.all(5)),
                                Image.asset(ex[i]['image'], fit: BoxFit.cover, height: 200,),
                                Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                                        color:  Color.fromRGBO(0, 0, 0, 0.4),
                                      ),
                                  padding: EdgeInsets.all(15),
                                  width: double.infinity,
                                  // color: Colors.purple,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        ex[i]['name'], 
                                        style: TextStyle(color: Colors.white, fontSize: 20),
                                      ),
                                      Text(
                                        (ex[i]['seconds']~/60).toString() + ':' + ((ex[i]['seconds']%60).toInt() == 0 ? '00' : (ex[i]['seconds']%60).toInt().toString()) + ' min',
                                        style: TextStyle(color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Card(
                  color: Colors.purple,
                  elevation: 100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    // side: BorderSide(width: 3, color: Colors.black)
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 5.0, bottom: 5, left: 10, right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'SETS',
                              style: TextStyle(color: Colors.white),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                // IconButton(
                                //   onPressed: null,
                                //   icon: Icon(Icons.remove),
                                // ),
                                GestureDetector(
                                  onTap: () {
                                    if (sets > 1) {
                                      sets--;
                                      durationCalc();
                                    }
                                  },
                                  child: Text(
                                    '−  ',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                                Text(
                                  sets.toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    sets++;
                                    durationCalc();
                                  },
                                  child: Text(
                                    '  +',
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                                // IconButton(
                                //   onPressed: null,
                                //   icon: Icon(Icons.add),
                                // )
                              ],
                            ),
                          ],
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'DURATION',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              (duration~/60).toString() + ':' + ((duration%60) == 0 ? '00' : (duration%60).toInt().toString()) + ' min',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                              ),
                            ),
                          ],
                        ),
                        MaterialButton(
                          elevation: 100,
                          color: Colors.green[400],
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ExercisePage(ex, duration, sets)));
                          },
                          child: Text(
                            'Start',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}