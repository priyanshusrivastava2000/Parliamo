import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///E:/FLutter%20Projets/parliamo/lib/pages/splash.dart';

void main() async{

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
              return splashScreen();
            }
        );
      },
    );
  }
}