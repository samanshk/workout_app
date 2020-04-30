import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Developer'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.purpleAccent,
                radius: 105,
                child: CircleAvatar(
                  radius: 100,
                  // backgroundImage: NetworkImage('https://media-exp1.licdn.com/dms/image/C5103AQEBeNOV1esoug/profile-displayphoto-shrink_200_200/0?e=1593648000&v=beta&t=hrRu9i1iDXRodYWjtWUmVtkz-XssHucW7UkVNCjIkNo'),
                  backgroundImage: AssetImage('assets/me.jpeg'),
                ),
              ),
              Text('Samansh Khandelwal', style: TextStyle(fontSize: 40), textAlign: TextAlign.center,),
              Text(
                'I am a student and a mobile app developer who lives in Jaipur, Rajasthan. Jaipur a.k.a. pink city is famous for its culture and heritage.',
                style: TextStyle(fontSize: 20), 
                // textAlign: TextAlign.center
              ),
              Text(
                'I have created this app for the App Challenge given by Hitesh Choudhary sir on his youtube channel. I have invested 30+ hours in creating this app and I expect to get ₹15000 - ₹20000 for this app.',
                style: TextStyle(fontSize: 20),
                // textAlign: TextAlign.center
              ),
              GestureDetector(
                onTap: () {launch('https://www.youtube.com/watch?v=VFrKjhcTAzE');},
                child: Text(
                  'Link to the challenge video',
                  style: TextStyle(fontSize: 20, color: Colors.purple),
                  // textAlign: TextAlign.center
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}