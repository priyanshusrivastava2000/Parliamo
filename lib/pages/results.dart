import 'package:flutter/material.dart';
import 'package:parliamo/functions/fetch.dart';
import 'package:parliamo/functions/resultsPDF.dart';
import 'package:parliamo/functions/transitionAnimation.dart';
import 'package:parliamo/homedemo.dart';
import 'package:parliamo/pages/testByCondition.dart';
class results extends StatefulWidget {
  final Color colour;
  const results({Key key, this.colour,this.image,this.reportType,this.careLine,this.result}) : super(key: key);
  final AssetImage image;
  final String reportType;
  final String careLine;
  final String result;
  @override
  _resultsState createState() => _resultsState();
}

class _resultsState extends State<results> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeef9f9),
      appBar: AppBar(
        backgroundColor: Color(0xff0e779a),
        title: Text('TAKE CARE',style: TextStyle(color: Colors.white,fontSize: 25)),
        centerTitle: true,
        leading: BackButton(
          onPressed: (){
           result = "";
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(icon: Icon(Icons.home),iconSize: 40,onPressed: (){
            Navigator.pop(context);
            Navigator.of(context).push(ScaleRoute(page: home()));
          },)
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(

            padding: const EdgeInsets.only(top:15.0,left: 15.0,),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'ANALYSIS',
                style: TextStyle(
                  fontFamily: 'Constantia',
                  fontSize: 35,
                  color: const Color(0xff08080a),
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: widget.colour,width: 5.0),
                color: Colors.white,
              ),


              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 180,child: Image(image: widget.image)),
                      Align(alignment: Alignment.topLeft,child: Text(widget.result.toUpperCase(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,)),

                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          child: Text(widget.reportType,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                        ),
                        Container(
                          width: 200,
                          child: Text(widget.careLine,style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          resultsPDF(result: widget.result,testName: testName,),
        ],
      ),
    );
  }
}
