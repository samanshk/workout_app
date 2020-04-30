import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:workout_app/EndPage.dart';

class ExercisePage extends StatefulWidget {
  List exercises;
  var duration;
  int sets;
  ExercisePage(this.exercises, this.duration, this.sets);

  @override
  _ExercisePageState createState() => _ExercisePageState(exercises, duration, sets);
}

class _ExercisePageState extends State<ExercisePage> {
  List exercises;
  var duration;
  int sets;
  _ExercisePageState(this.exercises, this.duration, this.sets);

 
  AudioPlayer audio;
  final player = AudioCache();

  int totalSets;
  int countDown;
  Timer timer;
  int exCountDown;

  int _currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  audioController(String op) async {
    if (op == 'play') {
      audio = await player.loop('track${_currentPage + 1}.mp3');
      setState(() {
        audio = audio;           
      });   
    } 
    else if (op == 'pause') {            
      await audio.stop();
      player.clearCache();      
    }       
  }

  breakInterval(interval) {
    setState(() {
      countDown = interval;
      exCountDown = exercises[_currentPage]['seconds'];
    });
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (countDown == 0) {
        timer.cancel();
        exerciseSwitch();
        audioController('play');
      } else {
        setState(() => countDown--);
      }
    });    
  }

  exerciseSwitch() {
    _currentPage == 0 ? setState(() => sets--) : null;
    print(sets);
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (exCountDown == 0) {
        timer.cancel();
        audioController('pause');
        if (sets == 0 && _currentPage == 4) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EndPage()));
        } else {
          setState(() {
            _currentPage < 4 ? _currentPage++ : _currentPage = 0;
          });
          breakInterval(40);
        }
      } else {
        setState(() {
          exCountDown--;
        });
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      totalSets = sets;
    });
    breakInterval(10);
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
    // player.clearCache();
    // audio.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
              child: Stack(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          child: Card(
                            // color: Colors.grey[400],
                            elevation: 20,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(exercises[i]['name'], style: TextStyle(fontSize: 30),),
                                Image.asset(exercises[i]['image'], height: 300,),
                                Text(
                                  // ((exercises[i]['seconds'] - n)~/60).toString() + ':' + (((exercises[i]['seconds'] - n)%60) == 0 ? '00' : ((exercises[i]['seconds'] - n)%60).toInt().toString()),
                                  (exCountDown~/60).toString() + ':' + (exCountDown%60 >= 0 && exCountDown%60 < 10 ? '0' + (exCountDown%60).toInt().toString() : (exCountDown%60).toInt().toString()),
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text('MINUTES\nLEFT', style: TextStyle(fontSize: 15), textAlign: TextAlign.center,)
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Card(
                            color: Colors.purple,
                            elevation: 10,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                  children: <Widget>[
                                    Text('EXERCISE', style: TextStyle(fontSize: 15, color: Colors.white),),
                                    Text('${_currentPage+1}/5', style: TextStyle(fontSize: 25, color: Colors.white),),
                                  ],
                                ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            color: Colors.purple,
                            elevation: 10,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: <Widget>[
                                  Text('    SET    ', style: TextStyle(fontSize: 15, color: Colors.white),),
                                  Text('${totalSets-sets}/$totalSets', style: TextStyle(fontSize: 25, color: Colors.white),),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ),
            Visibility(
              visible: countDown != 0,
              child: Container(
                color: Color.fromRGBO(0, 0, 0, 0.7),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('NEXT', style: TextStyle(fontSize: 15, color: Colors.white),),
                      Text(exercises[_currentPage]['name'], style: TextStyle(fontSize: 25, color: Colors.white),),
                      Image.asset(exercises[_currentPage]['image'], height: 200,),
                      Text(countDown.toString(), style: TextStyle(fontSize: 70, color: Colors.white),),
                      // Padding(padding: EdgeInsets.all(10)),
                    ],
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}