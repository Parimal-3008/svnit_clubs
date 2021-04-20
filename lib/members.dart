import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:svnit_clubs/gallery.dart';

class Members extends StatefulWidget {
  final String club;
  Members(this.club);
  @override
  _MembersState createState() => _MembersState(club);
}

class _MembersState extends State<Members> {
  String club;
  int ind;
  String uuu;
  bool isLoading = false;
  PDFDocument _doc;
  _MembersState(this.club);
  @override
  void initState() {
    super.initState();
    _initPdf();
  }

  String _uploadedFileURL;
  _initPdf() async {
    setState(() {
      isLoading = true;
    });
    DocumentSnapshot ds =
        await FirebaseFirestore.instance.collection('members').doc(club).get();
    // ignore: unnecessary_statements
    PDFDocument d = await PDFDocument.fromURL(ds['url']);
    setState(() {
      _doc = d;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter PDF Demo"),
          actions: [
            RaisedButton(
                child: Text('Replace '),
                onPressed: () async {
                  FilePickerResult result =
                      await FilePicker.platform.pickFiles();
                  if (result != null) {
                    File file = File(result.files.single.path);
                    String fileName =
                        (DateTime.now().toString()) + 'username.pdf';
                    Reference ref =
                        FirebaseStorage.instance.ref().child(fileName);
                    UploadTask uploadTask = ref.putFile(file);
                    uploadTask.then((res) {
                      setState(() async {
                        _uploadedFileURL = await res.ref.getDownloadURL();
                        print(_uploadedFileURL);
                        FirebaseFirestore.instance
                            .collection('members')
                            .doc(club)
                            .update({'url': _uploadedFileURL.toString()});
                             Navigator.push(context,MaterialPageRoute(builder: (context) => Members(club)),);
                      });
                    });
                  }
                })
          ],
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(child: PDFViewer(document: _doc)));
  }
}
