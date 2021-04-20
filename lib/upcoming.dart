import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:svnit_clubs/showannouncement.dart';

class Upcoming extends StatefulWidget {
  @override
  _UpcomingState createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Upcoming')),
          backgroundColor: Colors.blue,
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('announcements')
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              else {
                return ListView.builder(
                    itemCount: snapshot.data.size,
                    itemBuilder: (context, index) {
                      DocumentSnapshot ds = snapshot.data.docs[index];
                      var current = DateTime.now();
                      var t1 =ds['sort'].toDate();
                      var t2 = ds['sort1'].toDate();
                      
                    return   current.isBefore(t1) ?  Center(
                          child: (Column(children: [
                            InkWell(
                              child: Container(
                                child: Card(
                                  child: ListTile(
                                    leading: FlutterLogo(size: 56.0),
                                    title: Text(ds['title']),
                                    subtitle: Text(
                                        ds['club'] + '      ' + ds['location']),
                                    trailing: Text(
                                        ds['sdate'] + '      ' + ds['stime']),
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ShowAnnouncement(ds)),
                                );
                              },
                            ),
                            SizedBox(height: 10, width: 1000)
                          ])),
                        ):Container(height:0,width: 0,);
                      
                      
                     
                    });
              }
            }));
  }
}
