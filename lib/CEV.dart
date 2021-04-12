import 'package:flutter/material.dart';
class CEV extends StatefulWidget {
  @override
  _CEVState createState() => _CEVState();
}

class _CEVState extends State<CEV> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Center(child: Text('CEV')),
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