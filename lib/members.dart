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
  PDFDocument _doc;
  _MembersState(this.club);
  @override
  void initState() {
    super.initState();
    _initPdf();
  }

  _initPdf() async {}
  call(DocumentSnapshot ds) async {
    PDFDocument d = await PDFDocument.fromURL(ds['url']);
    setState(() {
      _doc = d;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Flutter PDF Demo"),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('members').doc(club).snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (!snapshot.hasData)
                return Center(child: CircularProgressIndicator());
              else {
                return ListView.builder(itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data;
                  call(ds);
                  return Center(
                      child:
                          (Row(children: [PDFViewer(document: _doc)])));
                });
              }
            }));
  }
}
