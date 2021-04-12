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
          title: Center(child: Text('Drishti')),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child: FloatingActionButton(onPressed: (){},
          backgroundColor: Colors.grey,
          child: Icon(Icons.add),
          ),
        )
    );
  }
}