import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class Gallery extends StatefulWidget {
   final int p;
  Gallery(this.p);
  @override
  _GalleryState createState() => _GalleryState(p);
}
class _GalleryState extends State<Gallery> {
  String video;
  String pics;int p;
  _GalleryState(this.p);
  List<String> listOfUrls ;
  List<Widget> listOfPics ;
     
  @override
  Widget build(BuildContext context) {
    if(p==1)
    {
            setState(() {
        video="drishtivideos";pics="drishtiimages";
      });
    }
    else if(p ==2)
    {
      setState(() {
        video="acmvideos";pics="acmimages";
      });
         
    }
     
     else if(p==3)
    {
      setState(() {
        video="dscvideos";pics="dscimages";
      });
         
    }
     
     else if(p==4)
    {
      setState(() {
        video="cevvideos";pics="cevimages";
      });
         
    }
     else if(p==5)
    {
      setState(() {
        video="chrdvideos";pics="chrdimages";
      });
         
    }
        return  DefaultTabController
    ( length: 2,
      child: Scaffold
    (
        appBar: AppBar(
          title: Center(child: Text('Gallery')),
          backgroundColor: Colors.blue,
          bottom: TabBar(tabs: [
            Tab(text: "Images"),
           Tab(text: "Videos"),
            
          ],),
          
        ),
        body: TabBarView(children: [
         StreamBuilder( stream: Firestore.instance.collection(pics).snapshots,
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
                  Column(children: [Text(ds['name']),
                  Image.network(ds['url']),
                  SizedBox(height: 30,width:1000)
                  ])
                ),
              );
            }
);
               }
         }
         ), 
         StreamBuilder( stream: Firestore.instance.collection(video).snapshots,
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
                  Column(children: [
                    YoutubePlayer(controller: YoutubePlayerController(
                 initialVideoId: YoutubePlayer.convertUrlToId(ds['url']),
                flags: YoutubePlayerFlags(
                autoPlay: false,
                mute: false,
                 ),
                ),
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.black,
                    ),
                  SizedBox(height: 50,width:1000)
                  ])
                ),
              );
            }
);
               }
         }
         ), 
         
               
         
          
         
        ],)
    ));
  }
}

