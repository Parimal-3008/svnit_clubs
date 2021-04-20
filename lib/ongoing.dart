import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:svnit_clubs/showannouncement.dart';

class Ongoing extends StatefulWidget {
  @override
  _OngoingState createState() => _OngoingState();
}

class _OngoingState extends State<Ongoing> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Ongoing')),
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
                    // ignore: missing_return
                    itemBuilder: (context, index) {
                      DocumentSnapshot ds = snapshot.data.docs[index];
                      var current = DateTime.now();
                      var t1 =ds['sort'].toDate();
                      var t2 = ds['sort1'].toDate();
                      return (t1.isBefore(current)==1&&current.isBefore(t2)==1)? Center(
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
                        ):SizedBox(width:1000,height:0);
                      
                    });
              }
            }));
  }
}
