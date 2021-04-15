import 'dart:core';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
class Announcement extends StatefulWidget {
  @override
  _AnnouncementState createState() => _AnnouncementState();
}
class _AnnouncementState extends State<Announcement> {
     String dropdownValue;
     DateTime startdate=DateTime.now();
     TimeOfDay starttime=TimeOfDay.now();String _uploadedFileURL;
     DateTime enddate;
     TimeOfDay endtime;
    String _hour, _minute;
     String dateTime;
     final _dateController = TextEditingController();
    var date1; var date2;var time1;var time2;
    String d1;String t1;
     File _image;    
    Image imgFile;
   final imgPicker = ImagePicker();
  String str='    ';String str1='   ';
  String str3=' ';String str4=' ';String desc;String title;String location;
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
        body:
        ListView(
                  children:[Column(crossAxisAlignment: CrossAxisAlignment.center,
          children:  <Widget>[
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
      items: <String>['Drishti', 'ACM', 'DSC', 'CEV','CHRD']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
      }).toList(),
    ),
           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children:[
             Column(
               children: [
                 ElevatedButton(
                   child:Text('Set Starting date'),onPressed: ()async {
           date1 =  await showDatePicker(
                    context: context, 
                    initialDate:DateTime.now(),
                    firstDate:DateTime(1900),
                    lastDate: DateTime(2100));
                    setState(() {
                      str=DateFormat('dd-MM-yyyy').format(date1);
                      d1=DateFormat('dd-MM-yyyy').format(date1);
                    });
          }),
                 Container(
          child:Text(str,style: TextStyle(fontSize: 20)),
          )
               ],
             ),
             Column(
               children: [
                 ElevatedButton(child:Text('Set Starting time'),onPressed:() async{
                    time1=await showTimePicker(context: context, 
                   initialTime: starttime);
                   setState(() {
                      starttime=time1;
                      _hour = time1.hour.toString();
                      _minute = time1.minute.toString();
                     str1 = _hour + ' : ' + _minute;
                     t1=str1;
                    });
                     
          }),
              Container(
          child:Text(str1,style: TextStyle(fontSize: 20)),
          )   
               ],
             ),
           
           ]    
           ),
           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children:[
             Column(
               children: [
                 ElevatedButton(
                   child:Text('Set ending date'),onPressed: ()async {
           date2 =  await showDatePicker(
                    context: context, 
                    initialDate:DateTime.now(),
                    firstDate:DateTime(1900),
                    lastDate: DateTime(2100));
                    setState(() {
                      if(DateFormat('dd-MM-yyyy').format(date2).compareTo(str)>=0)
                      str3=DateFormat('dd-MM-yyyy').format(date2);
                      else
                       return Fluttertoast.showToast(msg: 'Enter valid date',
      toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM, 
          backgroundColor:Colors.grey,
          textColor: Colors.black);
                    });
          }),
                 Container(
          child:Text(str3,style: TextStyle(fontSize: 20)),
          )
               ],
             ),
             Column(
               children: [
                 ElevatedButton(child:Text('Set ending time'),onPressed:() async{
                    time2=await showTimePicker(context: context, 
                   initialTime: starttime);
                   setState(() {
                      starttime=time2;
                      _hour = time2.hour.toString();
                      _minute = time2.minute.toString();
                      if((_hour + ' : ' + _minute).compareTo(str1)>=0||str3.compareTo(str)>0)
                     str4 = _hour + ' : ' + _minute;
                     else
                      return Fluttertoast.showToast(msg: 'Enter valid time',
      toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM, 
          backgroundColor:Colors.grey,
          textColor: Colors.black);
                    });
          }),
              Container(
          child:Text(str4,style: TextStyle(fontSize: 20)),
          )   
               ],
             ),
           ]    
           ),
          TextField(
                          controller: TextEditingController(),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Enter location of event"),
                             onChanged: (value) {
                                setState(() {
                                  location=value;
                                });
                              },
                        ),
          
             TextField(       
                          controller: TextEditingController(),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Enter title or name of event or announcement"),
                             onChanged: (value) {
                                setState(() {
                                  title=value;
                                });
                              },
                      ),
            Container(
            child:TextField(
                          controller: TextEditingController(),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Enter event description"),
                              onChanged: (value) {
                                setState(() {
                                  desc=value;
                                });
                              },        
                        ),
                        ),
                         RaisedButton(
                      color: Colors.blue,
                      child: Text('Upload Poster'),
                      onPressed: ()async {
                        final pickedFile = await imgPicker.getImage(source: ImageSource.gallery);
                        setState(() {
                          _image=File(pickedFile.path);
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
              ): Container(
                child: Image.file(
                  _image,
                  fit: BoxFit.cover,
                ),
              )),
              Row(mainAxisAlignment : MainAxisAlignment.end,children: [
                RaisedButton(onPressed: ()async{
                 FirebaseStorage storage = FirebaseStorage.instance;
                 var scheduledtime=(DateTime.parse(d1+' '+t1));

        Reference ref = storage.ref().child("username" + DateTime.now().toString());
        UploadTask uploadTask = ref.putFile(_image);
       uploadTask.then((res) {
           setState(() async {
             _uploadedFileURL = await res.ref.getDownloadURL() ;
           print(_uploadedFileURL);
           FirebaseFirestore.instance.collection('announcements').add({
             "imageurl":_uploadedFileURL,
             "club":dropdownValue,
             "description": desc,
             "title":title,
             "sdate":str ,
             "edate":str3,
             "stime": str1,
             "etime":str4,
             "location":location,
           });
           });
                });},child:Text('Announce'))
              ],)
    ]          
          )] 
        ),

    );
    
  }
}