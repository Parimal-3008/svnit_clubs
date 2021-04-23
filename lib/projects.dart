import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
//to create a project for a particular club
class Projects extends StatefulWidget {
  String club;String send;
  Projects(this.club)
  {
       if(club=='acm')
       send='acmprojects';
       if(club=='dsc')
       send='dscprojects';
       if(club=='cev')
       send='cevprojects';
       if(club=='drishti')
       send='drishtiprojects';
  }
  @override
  _ProjectsState createState() => _ProjectsState(send);
}

TextEditingController c1 = TextEditingController();
TextEditingController c2 = TextEditingController();
TextEditingController c3 = TextEditingController();
TextEditingController c4 = TextEditingController();

class _ProjectsState extends State<Projects> {
  String club;
  _ProjectsState(this.club);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Projects')),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  controller: c1,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      labelText: "Enter the project title"),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                  maxLines: 10,
                  controller: c2,
                   decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      labelText: "Enter the project idea"),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  maxLines: 10,
                  controller: c3,
                   decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      labelText: "Enter the tech stack "),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  maxLines: 2,
                  controller: c4,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      labelText: "Members with thier contact info"),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              FloatingActionButton(onPressed: ()async{
               
                      {
                        setState(() async {
                          FirebaseFirestore.instance
                              .collection(club)
                              .add({
                                "title":c1.text,
                                "description":c2.text,
                                "tech":c3.text,
                                "members":c4.text,
                                "sort":Timestamp.fromDate(DateTime.now()),
                           
                          });
                        });
                      }
               

              },
              child: Text('Upload Project')
              )            
            ],
          ),
        ));
  }
}
