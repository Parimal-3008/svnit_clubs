import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:svnit_clubs/upcoming.dart';
import 'ACM.dart';
import 'CEV.dart';
import 'announcement.dart';
import 'ongoing.dart';

class ClubList extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => new _ClubListState();
}
class _ClubListState extends State<ClubList>
 {
   
   @override
  Widget build(BuildContext context) {
     return new Scaffold(
        drawer: new Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Upcoming Events'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Upcoming()));
                },
              ),
                ListTile(
                title: Text('Ongoing Events'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Ongoing()));
                },
              ),
                ListTile(
                title: Text('Announce an Event'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Announcement()));
                },
              ),
              Divider(
                color: Colors.black,
                thickness: 5.0,
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Center(child: Text('CLUBS')),
          backgroundColor: Colors.blue,
          actions: <Widget>[
    IconButton(
      icon: Icon(
        Icons.logout,
        color: Colors.white,
      ),
      onPressed: () {
        setState(() {
           FirebaseAuth.instance.signOut();
           Navigator.pop(context);
        });
       },
    )
  ],
  ),
  body: Padding(
    padding: const EdgeInsets.all(8.0),
    child: 
    ListView(
      children:<Widget>[
    Column(
       crossAxisAlignment: CrossAxisAlignment.stretch,
      
      children:<Widget> [
           ListButton('images/download1.jpeg','',1),
           SizedBox(
             height: 20,
           ),
          ListButton('images/download2.jpeg','',2),
          SizedBox(
             height: 20,
           ),
           ListButton('images/download3.jpeg','',3),
           SizedBox(
             height: 20,
           ),
           ListButton('images/download4.jpeg','',4),
           SizedBox(
             height: 20,
           ),
           ListButton('images/download6.jpeg','',5),
],
    ),
      ]
  ),
  ),  

     );
  }
 }

class ListButton extends StatelessWidget {
   final String str;
   final String text;
   final int ind;
    ListButton(this.str,this.text,this.ind);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
        child: Opacity(
          opacity:0.5 ,
           child: Container(       
    height: 150,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(30),
      image: DecorationImage(
        image :AssetImage(str) ,
        fit:BoxFit.fill,
      ),
          ),
          child: Text(text,textAlign: TextAlign.center,style: TextStyle(
          fontSize:50,fontWeight: FontWeight.w900,
          color: Colors.redAccent.withOpacity(1.0)
          ) ,),
          ),
        ),
        onTap:(
        ){
          if(ind==1)
         Navigator.push(context,MaterialPageRoute(builder: (context) =>ACM('drishti') ),   );
         else if(ind==2)
         Navigator.push(context,MaterialPageRoute(builder: (context) =>ACM('acm') ),   );
         else if(ind==3)
         Navigator.push(context,MaterialPageRoute(builder: (context) =>ACM('dsc') ),   );
         else
         Navigator.push(context,MaterialPageRoute(builder: (context) =>ACM('chrd') ),   );
        }
      );
  }
}