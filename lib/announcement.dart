import 'dart:core';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Announcement extends StatefulWidget {
  @override
  _AnnouncementState createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  String dropdownValue;
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  DateTime startdate = DateTime.now();
  TimeOfDay starttime = TimeOfDay.now();
  String _uploadedFileURL;
  DateTime enddate;
  TimeOfDay endtime;
  String _hour, _minute;
  String dateTime;
  final _dateController = TextEditingController();
  var date1;
  var date2;
  var time1;
  var time2;
  String d1;String d2;
  String t1;
  String d11;String d12;
  String sty;
  File _image;
  Image imgFile;
  final imgPicker = ImagePicker();
  String str = '    ';
  String str1 = '   ';
  String str3 = ' ';
  String str4 = ' ';
  String desc;
  String title;
  String location;
  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Announcement')),
          backgroundColor: Colors.blue,
        ),
        body: ListView(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
              Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['Drishti', 'ACM', 'DSC', 'CEV', 'CHRD']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(
                children: [
                  ElevatedButton(
                      child: Text('Set Starting date'),
                      onPressed: () async {
                        var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));

                        setState(() {
                          str = DateFormat('dd-MM-yyyy').format(date);
                          d1 = date.toString().substring(0, 10);
                        });
                        d11 = d1;
                      }),
                  Container(
                    child: Text(str, style: TextStyle(fontSize: 20)),
                  )
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                      child: Text('Set Starting time'),
                      onPressed: () async {
                        var time = await showTimePicker(
                            context: context, initialTime: starttime);
                        setState(() {
                          starttime = time;
                          _hour = time.hour.toString();
                          if(_hour.length==1)
                          _hour="0"+_hour;
                          _minute = time.minute.toString();
                          if(_minute.length==1)
                          _minute="0"+_minute;
                          str1 = _hour + ':' + _minute;
                        });
                        t1 = str1;
                      }),
                  Container(
                    child: Text(str1, style: TextStyle(fontSize: 20)),
                  )
                ],
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(
                children: [
                  ElevatedButton(
                      child: Text('Set ending date'),
                      onPressed: () async {
                        var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));
                        setState(() {
                          if (DateFormat('dd-MM-yyyy')
                                  .format(date)
                                  .compareTo(str) >=
                              0)
                            str3 = DateFormat('dd-MM-yyyy').format(date);
                          else
                            return Fluttertoast.showToast(
                                msg: 'Enter valid date',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.grey,
                                textColor: Colors.black);
                                 d2 = date.toString().substring(0, 10);
                        });
                        d12=d2;
                      }),
                  Container(
                    child: Text(str3, style: TextStyle(fontSize: 20)),
                  )
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                      child: Text('Set ending time'),
                      onPressed: () async {
                        var time = await showTimePicker(
                            context: context, initialTime: starttime);
                        setState(() {
                          starttime = time;
                         _hour = time.hour.toString();
                          if(_hour.length==1)
                          _hour="0"+_hour;
                          _minute = time.minute.toString();
                          if(_minute.length==1)
                          _minute="0"+_minute;
                          if ((_hour + ':' + _minute).compareTo(str1) >= 0 ||
                              str3.compareTo(str) > 0)
                            str4 = _hour + ':' + _minute;
                          else
                            return Fluttertoast.showToast(
                                msg: 'Enter valid time',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.grey,
                                textColor: Colors.black);
                                
                        });
                        
                      }),
                  Container(
                    child: Text(str4, style: TextStyle(fontSize: 20)),
                  )
                ],
              ),
            ]),
            TextField(
              controller: c1,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter location of annnouncement"),
              onChanged: (value) {
                setState(() {
                  location = value;
                });
              },
            ),
            TextField(
              controller: c2,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter title of announcemnt"),
              onChanged: (value) {
                setState(() {
                  title = value;
                });
              },
            ),
            Container(
              width: double.infinity,
              height: 100,
              child: TextField(
                controller: c3,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Describe your event"),
                onChanged: (value) {
                  setState(() {
                    desc = value;
                  });
                },
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              child: Text('Upload Poster'),
              onPressed: () async {
                final pickedFile =
                    await imgPicker.getImage(source: ImageSource.gallery);
                setState(() {
                  _image = File(pickedFile.path);
                });
              },
            ),
            Container(
                child: _image == null
                    ? Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 40.0,
                            ),
                          ],
                        ),
                      )
                    : Container(
                        child: Image.file(
                          _image,
                          fit: BoxFit.cover,
                        ),
                      )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                    onPressed: () async {
                      FirebaseStorage storage = FirebaseStorage.instance;

                      Reference ref = storage
                          .ref()
                          .child("username" + DateTime.now().toString());
                      UploadTask uploadTask = ref.putFile(_image);
                      uploadTask.then((res) {
                        setState(() async {
                          _uploadedFileURL = await res.ref.getDownloadURL();
                          print(_uploadedFileURL);

                          FirebaseFirestore.instance
                              .collection('announcements')
                              .add({
                            "imageurl": _uploadedFileURL,
                            "club": dropdownValue,
                            "description": desc,
                            "title": title,
                            "sdate": str,
                            "edate": str3,
                            "stime": t1,
                            "etime": str4,
                            "location": location,
                            "scheduled": d11 + " " + t1 + ":00",
                            "scheduled_end":d12+" "+str4+":00",
                            "sort":Timestamp.fromDate(DateTime.parse(d11 + " " + t1 + ":00")),
                            "sort1":Timestamp.fromDate(DateTime.parse(d12 + " " + str4 + ":00")),
                          });
                        });
                      });
                    },
                    child: Text('Announce'))
              ],
            )
          ]),
        ]));
  }
}
