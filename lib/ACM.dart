import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:svnit_clubs/DisplayProject.dart';
import 'package:svnit_clubs/gallery.dart';
import 'package:svnit_clubs/members.dart';
import 'package:svnit_clubs/ongoing.dart';
import 'package:svnit_clubs/showannouncement.dart';
import 'package:svnit_clubs/showproject.dart';
import 'package:svnit_clubs/upcoming.dart';

import 'announcement.dart';

//import 'package:path/path.dart' as Path;
class ACM extends StatefulWidget {
  String str;
  ACM(this.str);
  @override
  _ACMState createState() => _ACMState(str);
}

class _ACMState extends State<ACM> {
  String club;

  final imgPicker = ImagePicker();
  _ACMState(this.club);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       
        appBar: AppBar(
          title: Center(child: Text('$club')),
          backgroundColor: Colors.blue,
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'What is $club?',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                   
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Members(club)),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    child: Text(
                      'Members',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowProject(club)),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    child: Text(
                      'Projects',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              
              Container(
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Gallery(club)),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ]));
  }
}

/*
FloatingActionButton(
              onPressed: () async {
                // String fileName = basename(_image.path);
                FirebaseStorage storage = FirebaseStorage.instance;
                Reference ref =
                    storage.ref().child("username" + DateTime.now().toString());
                UploadTask uploadTask = ref.putFile(_image);
                uploadTask.then((res) {
                  setState(() async {
                    _uploadedFileURL = await res.ref.getDownloadURL();
                    print(_uploadedFileURL);
                    FirebaseFirestore.instance.collection('acmimages').add({
                      "url": _uploadedFileURL,
                      "name": "Username",
                    });
                  });
                });
              },
              backgroundColor: Colors.grey,
              child: Text('UPLOAD'),
            ),



FloatingActionButton(
              onPressed: () async {
                final pickedFile =
                    await imgPicker.getImage(source: ImageSource.gallery);

                setState(() {
                  _image = File(pickedFile.path);
                });
              },
              backgroundColor: Colors.grey,
              child: Icon(Icons.add),
            ),
            */
