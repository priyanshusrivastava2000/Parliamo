import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class resultsPDF extends StatefulWidget {

  final String pdf;
  const resultsPDF({Key key, this.pdf,this.result,this.testName}) : super(key: key);
  final String result,testName;
  @override
  _PDFViewerState createState() => _PDFViewerState();
}
String pdf;
class _PDFViewerState extends State<resultsPDF> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  int totalPages = 0;
int currentPages = 0 ;
bool pdfReady;

  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  String localFile ;

  Future<String> loadPDFurl() async{
    try{
      print(widget.result);
       pdf = await firebaseStorage.ref().child(widget.testName).child(widget.result+'.pdf').getDownloadURL();
      return pdf;
    }
    catch(e){
      pdf = null;
      return pdf;
    }
  }

  Future<String> getFile() async{
    http.Response response;
    await loadPDFurl().then((value) async{
      if(value != null)
        {
          response = await http.get(value);
        }
      else{
        response = null;
      }
    });
    if(response != null)
      {
        var dir = await getTemporaryDirectory();
        File file = File(dir.path + "/data.pdf");
        await file.writeAsBytes(response.bodyBytes,flush: true);
        return file.path;
      }
    else{
      return null;
    }
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
    return Container(
      child: (localFile!=null||pdf !=null)?Container(width: 300,child: SfPdfViewer.network(pdf,canShowScrollHead: false,),key: _pdfViewerKey,):SizedBox(height: 20,)
    );

  }
}