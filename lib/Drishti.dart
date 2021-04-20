import 'package:flutter/material.dart';

class Drishti extends StatefulWidget {
  @override
  _DrishtiState createState() => _DrishtiState();
}

class _DrishtiState extends State<Drishti> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Show Announcements')),
          backgroundColor: Colors.blue,
        ),
        body: RichText(
          text: TextSpan(
            text: 'Hello ',
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                  text: 'bold', style: TextStyle(fontWeight: FontWeight.bold)),
              TextSpan(text: ' world!'),
            ],
          ),
        ));
  }
}
