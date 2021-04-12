import 'package:flutter/material.dart';
class CHRD extends StatefulWidget {
  @override
  _CHRDState createState() => _CHRDState();
}

class _CHRDState extends State<CHRD> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Center(child: Text('CHRD')),
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