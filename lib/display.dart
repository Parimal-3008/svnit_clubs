import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:svnit_clubs/showannouncement.dart';

class Display extends StatefulWidget {
  @override
  _DisplayState createState() => _DisplayState();
}
 
class _DisplayState extends State<Display> {
  @override
  void initState() {
    // TODO: implement initState
     FirebaseFirestore rootRef = FirebaseFirestore.instance;
CollectionReference idsRef = rootRef.collection("announcements");
 idsRef.orderBy("sort",descending: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Display')),
        backgroundColor: Colors.blue,
      ),
      body:StreamBuilder( stream: FirebaseFirestore.instance.collection('announcements').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
        {
                if (!snapshot.hasData)
             return Center(child: CircularProgressIndicator());
           else
            {
            return  ListView.builder(
       itemCount: snapshot.data.size,
        itemBuilder: (context, index) {
          DocumentSnapshot ds = snapshot.data.docs[index];
         return Center(
           child: (
             Column(children: [ InkWell(
                            child: Container(
                 child: Card(
      child: ListTile(
        leading: FlutterLogo(size: 56.0),
        title: Text(ds['title']),
        subtitle: Text(ds['club']+'      '+ds['location']),
        trailing: Text(ds['sdate']+'      '+ ds['stime']),
      ),
    ),
               ),
               onTap: (){
                 Navigator.push(context,MaterialPageRoute(builder: (context) => ShowAnnouncement(ds)),);
               },
             ),
             
             SizedBox(height: 10,width:1000)
               ]
               )
          ),
           );
          }
        );
             }
       }
       )
    
    );
    }
}
