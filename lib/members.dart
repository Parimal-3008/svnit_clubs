import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class Members extends StatefulWidget {
  final String club;
  Members(this.club);
  @override
  _MembersState createState() => _MembersState(club);
}

class _MembersState extends State<Members> {
  String club;
  int ind;
  bool isLoading = false;
  PDFDocument _doc;
  _MembersState(this.club);
  @override
  void initState() {
    super.initState();
    _initPdf();
  }

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
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(child: PDFViewer(document: _doc)));
  }
}
