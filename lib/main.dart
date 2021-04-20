import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:svnit_clubs/announcement.dart';
import 'package:svnit_clubs/display.dart';
import 'package:svnit_clubs/ongoing.dart';
import 'package:svnit_clubs/upcoming.dart';

//import 'package:firebase_auth/firebase_auth.dart';
void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      home: Ongoing(),
    );
  }
}