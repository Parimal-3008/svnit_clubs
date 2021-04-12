import 'package:flutter/material.dart';
class DSC extends StatefulWidget {
  @override
  _DSCState createState() => _DSCState();
}

class _DSCState extends State<DSC> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Center(child: Text('DSC')),
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