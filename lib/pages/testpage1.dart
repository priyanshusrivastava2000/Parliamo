import 'package:flutter/material.dart';
import 'package:parliamo/functions/fetch.dart';
import 'package:parliamo/functions/transitionAnimation.dart';
import 'package:parliamo/pages/addReports.dart';
import 'package:parliamo/pages/testByCondition.dart';


class testAlpha extends StatefulWidget {
  @override
  _testAlphaState createState() => _testAlphaState();
}

class _testAlphaState extends State<testAlpha> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          shrinkWrap: true,
            itemCount: alphabets.length,
            itemBuilder: (BuildContext context,int index){
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: new Text(
                        "${alphabets[index]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Segoe UI",fontWeight: FontWeight.w700,
                          fontSize: 30,
                          color:Color(0xff01182a),
                        ),
                      ),
                    ),
                  ),
                  Divider(thickness: 4,),
                  FutureBuilder<List<String>>(
                    future: gettingTests(alphabets[index]),
                      builder: (context,snap){

                    if(!snap.hasData){
                      return CircularProgressIndicator();
                    }

                    else{
                      return (snap.data.length!=0)?GridView.builder(
                        shrinkWrap: true,
                        itemCount: snap.data.length,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                        ),
                        itemBuilder: (context,index1){
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                color: Color(0xff01182a),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: FlatButton(child: Align(alignment: Alignment.center,child: Text('${snap.data[index1]}',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),)),
                                onPressed: (){
                                  setState(() {
                                    testName = snap.data[index1];
                                    print(testName);
                                  });
                                  gettingParameters(snap.data[index1]).whenComplete((){
                                    Navigator.of(context).push(ScaleRoute(page: addTest()));
                                  });
                                },),
                              ),
                            ),
                          );
                        },
                      ):SizedBox(height: 1,);
                        }

                  }),

                ],
              );
            }
            ),
      ),
    );
  }
}
