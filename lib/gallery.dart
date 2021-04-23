// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'addimage.dart';
import 'addvideo.dart';

class Gallery extends StatefulWidget {
  final String club;
  Gallery(this.club);
  @override
  _GalleryState createState() => _GalleryState(club);
}

class _GalleryState extends State<Gallery> {
  String video;
  String pics;
  String club;
  _GalleryState(String s) {
    club = s;
    video = club + "videos";
    pics = club + "images";
  }
  List<String> listOfUrls;
  List<Widget> listOfPics;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            drawer: new Drawer(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    title: Text('Add Image'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddImage(club)));
                    },
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 5.0,
                  ),
                  ListTile(
                    title: Text('Add Video'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddVideo(club)));
                    },
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              title: Center(child: Text('Gallery')),
              backgroundColor: Colors.blue,
              bottom: TabBar(
                tabs: [
                  Tab(text: "Images"),
                  Tab(text: "Videos"),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                StreamBuilder(
                    stream:
                        FirebaseFirestore.instance.collection(pics).snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (!snapshot.hasData)
                        return Center(child: CircularProgressIndicator());
                      else {
                        return ListView.builder(
                            itemCount: snapshot.data.size,
                            itemBuilder: (context, index) {
                              DocumentSnapshot ds = snapshot.data.docs[index];
                              return Center(
                                child: (Column(children: [
                                  
                                  Image.network(ds['url']),
                                  SizedBox(height: 30, width: 1000)
                                ])),
                              );
                            });
                      }
                    }),
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection(video)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (!snapshot.hasData)
                        return Center(child: CircularProgressIndicator());
                      else {
                        return ListView.builder(
                            itemCount: snapshot.data.size,
                            itemBuilder: (context, index) {
                              DocumentSnapshot ds = snapshot.data.docs[index];
                              return Center(
                                child: (Column(children: [
                                  YoutubePlayer(
                                    controller: YoutubePlayerController(
                                      initialVideoId:
                                          YoutubePlayer.convertUrlToId(
                                              ds['url']),
                                      flags: YoutubePlayerFlags(
                                        autoPlay: false,
                                        mute: false,
                                      ),
                                    ),
                                    showVideoProgressIndicator: true,
                                    progressIndicatorColor: Colors.black,
                                  ),
                                  SizedBox(height: 50, width: 1000)
                                ])),
                              );
                            });
                      }
                    }),
              ],
            )));
  }
}
