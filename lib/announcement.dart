import 'dart:core';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
class Announcement extends StatefulWidget {
  @override
  _AnnouncementState createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
    final controller1 = TextEditingController();final controller21 = TextEditingController();
     String dropdownValue;
     DateTime startdate=DateTime.now();
     TimeOfDay starttime=TimeOfDay.now();
     DateTime enddate;
     TimeOfDay endtime;
    String _hour, _minute;
     String dateTime;
    
     final _dateController = TextEditingController();
     
    var date1;
    
   
  String str='    ';String str1='   ';
  String str3=' ';String str4=' ';
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
        body:Column(crossAxisAlignment: CrossAxisAlignment.center,
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
        var date =  await showDatePicker(
                  context: context, 
                  initialDate:DateTime.now(),
                  firstDate:DateTime(1900),
                  lastDate: DateTime(2100));
                  setState(() {
                    
                    str=DateFormat('dd-MM-yyyy').format(date);
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
                 var time=await showTimePicker(context: context, 
                 initialTime: starttime);
                 setState(() {
                    starttime=time;
                    _hour = time.hour.toString();
                    _minute = time.minute.toString();
                   str1 = _hour + ' : ' + _minute;
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
        var date =  await showDatePicker(
                  context: context, 
                  initialDate:DateTime.now(),
                  firstDate:DateTime(1900),
                  lastDate: DateTime(2100));
                  setState(() {
                    if(DateFormat('dd-MM-yyyy').format(date).compareTo(str)>=0)
                    str3=DateFormat('dd-MM-yyyy').format(date);
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
                 var time=await showTimePicker(context: context, 
                 initialTime: starttime);
                 setState(() {
                    starttime=time;
                    _hour = time.hour.toString();
                    _minute = time.minute.toString();
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
                        controller: controller1,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter title of announcemnt"),
                      ),
        Container(width:double.infinity,
        height: 100,
          child: TextField(       
                        controller: controller21,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter your announcemnt"),
         ),),
        
        ]
        
        ),

    );
    
  }
}