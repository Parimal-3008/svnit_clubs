import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class AddVideo extends StatefulWidget {
  String club;
  AddVideo(this.club);
  @override
  _AddVideoState createState() => _AddVideoState(club);
}
TextEditingController c3=TextEditingController();
class _AddVideoState extends State<AddVideo> {
  String club;
  _AddVideoState(String st)
  {
    this.club=st+"videos";
  }
  String url;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Center(child: Text('AddVideo')),
          backgroundColor: Colors.blue,
        ),
        body:Column(children:[
          Container(
              width: double.infinity,
              height: 100,
              child: TextField(
                maxLines: 1,
                controller: c3,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter youtube link"),
                onChanged: (value) {
                  setState(() {
                    url = value;
                  });
                },
              ),
            ),
            url!=null?YoutubePlayer(
                                    controller: YoutubePlayerController(
                                      initialVideoId:
                                          YoutubePlayer.convertUrlToId(
                                              url),
                                      flags: YoutubePlayerFlags(
                                        autoPlay: false,
                                        mute: false,
                                      ),
                                    ),
                                    showVideoProgressIndicator: true,
                                    progressIndicatorColor: Colors.black,
                                  ):Container(height:0,width:0),
                                  url!=null?
                                  RaisedButton(onPressed: (){
                                    FirebaseFirestore.instance.collection(club).add({
                                      "url":url,
                                      "sort":Timestamp.fromDate(DateTime.now()),
                                      

                                    });
                                    setState(() {
                                       Navigator.pop(context);
                                    });
                                   
                                  },child:Text('upload url')):Container()
        ])
    );
  }
}