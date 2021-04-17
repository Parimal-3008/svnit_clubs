import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notify extends StatefulWidget {
  final String club;
  final bool status;
  Notify(this.club, this.status);
  @override
  _NotifyState createState() => _NotifyState(club, status);
}

class _NotifyState extends State<Notify> {
  String club;
  bool status;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  _NotifyState(String df, bool sd) {
    this.club = df;
    this.status = sd;
  }
  @override
  void initState() {
    super.initState();

    var initSetttings = InitializationSettings();
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: null);
  }

  Future<void> showScheduleNotification(var schtime) async {
    var platformDetails = NotificationDetails();
// ignore: deprecated_member_use
    await flutterLocalNotificationsPlugin.schedule(
        0,
        'Flutter Local Notification',
        'Flutter Schedule Notification',
        schtime,
        platformDetails,
        payload: 'Destination Screen(Schedule Notification)');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder(
      stream:
          FirebaseFirestore.instance.collection("announcements").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        else {
          ListView.builder(
              itemCount: snapshot.data.size,
              itemBuilder: (context, index) {
                // ignore: unused_local_variable
                DocumentSnapshot ds = snapshot.data.docs[index];
                if (ds['club'] == club) {
                  var scheduledtime = DateTime.parse(ds['scheduled']);
                  showScheduleNotification(scheduledtime);
                }
                return null;
              });
          return null;
        }
      },
    ));
  }
}
