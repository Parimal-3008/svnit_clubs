import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:svnit_clubs/DisplayProject.dart';
import 'package:svnit_clubs/showannouncement.dart';
//show list of projects of a particular club
class ShowProject extends StatefulWidget {
  String club;//send collection name
  ShowProject(this.club);
  @override
  _ShowProjectState createState() => _ShowProjectState(club);
}

class _ShowProjectState extends State<ShowProject> {
  String club;
  _ShowProjectState(String st){
    club=st+"projects";
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Center(child: Text('ShowProject')),
          backgroundColor: Colors.blue,
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection(club)
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
                     
                      return  Center(
                          child: (Column(children: [
                            InkWell(
                              child: Container(
                                child: Card(
                                  child: ListTile(
                                    leading: FlutterLogo(size: 56.0),
                                    title: Text(ds['title']),
                                    subtitle: Text(
                                        ds['tech'] ),
                                   
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                       DisplayProject(ds)),
                                );
                              },
                            ),
                            SizedBox(height: 10, width: 1000)
                          ])),
                        );
                      
                    });
              }
            }));
  }
}
