import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class DisplayProject extends StatefulWidget {
  DocumentSnapshot ds;
  DisplayProject(this.ds);
  @override
  _DisplayProjectState createState() => _DisplayProjectState(ds);
}

class _DisplayProjectState extends State<DisplayProject> {
  DocumentSnapshot ds;
  _DisplayProjectState(this.ds);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Center(child: Text('DisplayProject')),
          backgroundColor: Colors.blue,
        ),
        body:  Container(child:ListView(children: [
          Center(child: Container(child: Text(ds['title'],style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 35),))),
          SizedBox(height:23,width: 1000,),
          Center(child: Container(child: Text('Brief Overview :',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 30), ))),
          Container(child: Text(ds['description'],style: TextStyle(fontSize: 20) ,)),
          SizedBox(height:23,width: 1000,),
          Center(child: Container(child: Text('Tech Stack involved:',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 30),))),
           Container(child: Text(ds['tech'],style: TextStyle(fontSize: 20))),
            SizedBox(height:23,width: 1000,),
          Center(child: Container(child: Text('Members',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 30),))),
          Container(child: Text(ds['members'],style: TextStyle(fontSize: 20))),

          
        ],)),
    );
  }
}