import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';   
import 'package:image_picker/image_picker.dart';
//import 'package:path/path.dart' as Path;  
class ACM extends StatefulWidget {
  @override
  _ACMState createState() => _ACMState();
}

class _ACMState extends State<ACM> {
  File _image;    
   String _uploadedFileURL;   
   Image imgFile;
   
final imgPicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Center(child: Text('ACM')),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
           FloatingActionButton(onPressed: () async  
          { 
            final pickedFile = await imgPicker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }
         ,backgroundColor: Colors.grey,
          child: Icon(Icons.add),
          ),
          FloatingActionButton(onPressed: ()  async {    
        // String fileName = basename(_image.path);
    FirebaseStorage storage = FirebaseStorage.instance;
        StorageReference ref = storage.ref().child("username" + DateTime.now().toString());
         StorageUploadTask uploadTask = ref.putFile(_image);
       /* uploadTask.then((res) {
           setState(() async {
             _uploadedFileURL = await res.ref.getDownloadURL() ;
           print(_uploadedFileURL);
           Firestore.instance.collection('acmimages').add({
             "url":_uploadedFileURL,
             "name": "Username",
           });
           });
           
}*/
 
 },      backgroundColor: Colors.grey,
          child: Text('UPLOAD'),
          ),
          
          ]
        ),
        
        )
    );
  }
}