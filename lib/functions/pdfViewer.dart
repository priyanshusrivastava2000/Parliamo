import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PDFViewer extends StatefulWidget {

  final String organ;
  const PDFViewer({Key key, this.organ,this.type}) : super(key: key);
  final int type;
  @override
  _PDFViewerState createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> with WidgetsBindingObserver {
  int totalPages = 0;
  int currentPages = 0 ;
  bool pdfReady;
  final Completer<PDFViewController> _controller = Completer<PDFViewController>();
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  String localFile ;
  String pdf;
  Future<String> loadPDFurl() async{
    try{
        switch(widget.type){
          case 1:
          {
            print(widget.organ);
            pdf = await firebaseStorage.ref().child(widget.organ).child('overview.pdf').getDownloadURL();
            return pdf;
          }
          case 2:
            {
              print(widget.organ);
               pdf = await firebaseStorage.ref().child(widget.organ).child('sym.pdf').getDownloadURL();
              return pdf;
            }
          case 3:
            {
              print(widget.organ);
               pdf = await firebaseStorage.ref().child(widget.organ).child('causes.pdf').getDownloadURL();
              return pdf;
            }
          case 4:
            {
              print(widget.organ);
               pdf = await firebaseStorage.ref().child(widget.organ).child('type.pdf').getDownloadURL();
              return pdf;
            }
          case 5:
            {
              print(widget.organ);
              pdf = await firebaseStorage.ref().child(widget.organ).child('test.pdf').getDownloadURL();
              return pdf;
            }
        }


    }
    catch(e){
      print(e);
    }
  }

  Future<String> getFile() async{
    http.Response response;
    await loadPDFurl().then((value) async{
      response = await http.get(value);

    });

    var dir = await getTemporaryDirectory();
    File file = File(dir.path + "/data.pdf");
    await file.writeAsBytes(response.bodyBytes,flush: true);
    return file.path;
  }

  @override
  void initState() {
    super.initState();
    getFile().then((value){
      setState(() {
        localFile = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: (localFile != null)?Container(width: 300,child: SfPdfViewer.network(pdf,canShowScrollHead: false,),):Center(child: CircularProgressIndicator(),),
    );

  }
}