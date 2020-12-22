import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parliamo/functions/pdfViewer.dart';
import 'package:parliamo/pages/diagnosis.dart';
import 'package:parliamo/pages/faq.dart';
import 'package:parliamo/pages/lifecycleDisorder.dart';
import 'package:parliamo/pages/profilePage.dart';
import 'package:parliamo/pages/results.dart';
import 'package:parliamo/pages/starter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Home()
  )
  );
}
class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints){
        return OrientationBuilder(
            builder:(context,orientation){
              // SizeConfig().init(constraints, orientation,MediaQuery.of(context).padding.top,MediaQuery.of(context).padding.bottom,MediaQuery.of(context).padding.right,MediaQuery.of(context).padding.left);
              return starterPage();
            }
        );
      },
    );
  }
}