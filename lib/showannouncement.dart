import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class ShowAnnouncement extends StatefulWidget {
  DocumentSnapshot ds;
  ShowAnnouncement(this.ds);
  @override
  _ShowAnnouncementState createState() => _ShowAnnouncementState(ds);
}

class _ShowAnnouncementState extends State<ShowAnnouncement> {
  DocumentSnapshot ds;
  _ShowAnnouncementState(this.ds);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Center(child: Text('ShowAnnouncement')),
          backgroundColor: Colors.blue,
        ),
        body:  Container(child:ListView(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text(ds['club'],style: TextStyle(fontSize: 23) ,),Text(ds['title'],style: TextStyle(fontSize: 23)),Text('   ')],),
          SizedBox(height:23,width: 1000,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text('Location: '+ds['location'],style: TextStyle(fontSize: 23)),Text('Starts at: '+ds['stime'],style: TextStyle(fontSize: 23)),],),
          SizedBox(height:23,width: 1000,),
          Center(child: Image.network(ds['imageurl']),),
          SizedBox(height:23,width: 1000,),
          Container(child: Text(ds['description'],style: TextStyle(fontSize: 18) ,))
        ],)),
    );
  }
}