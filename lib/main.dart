
import 'package:flutter/material.dart';
import 'package:parliamo/pages/spashScreen.dart';





void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
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