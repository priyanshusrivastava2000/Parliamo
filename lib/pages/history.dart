import 'package:flutter/material.dart';
import 'package:parliamo/functions/deleteFunctions.dart';
import 'package:parliamo/functions/fetch.dart';
import 'package:parliamo/functions/transitionAnimation.dart';
import 'package:parliamo/pages/savedResults.dart';
String savedTest = "";
class history extends StatefulWidget {
  @override
  _historyState createState() => _historyState();
}

class _historyState extends State<history> {
  bool progress = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(subTestList.length != 0)
      {
        setState(() {
          progress = true;
        });
      }
    else{
      setState(() {
        progress =false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:  (){
        Navigator.pop(context);
        subTestList.clear();
      },
      child: Scaffold(
        backgroundColor: const Color(0xffeef9f9),
        appBar: AppBar(
          backgroundColor: Color(0xff0e779a),
          title: Text('TAKE CARE',style: TextStyle(color: Colors.white,fontSize: 25)),
          centerTitle: true,
          leading: BackButton(
            onPressed: (){
              setState(() {
                subTestList.clear();
              });
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ADDED TESTS',
                    style: TextStyle(
                      fontFamily: 'Constantia',
                      fontSize: 30,
                      color: const Color(0xff08080a),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Container(
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: subTestList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(subTestList[index].split("_").last.replaceAll("(", "").replaceAll(")", "").split('.').first,style: TextStyle(fontWeight: FontWeight.bold,),),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 12.0,top: 5),
                              child: Container(
                                width: 340.0,
                                height: 134.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(35.0),
                                  color: const Color(0xffffffff),
                                  border: Border.all(width: 3.0, color: const Color(0xff707070)),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      width: 90.0,
                                      height: 103.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('images/tests.png'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Container(
                                          width: 190.0,
                                          height: 50.0,
                                          child: Text(
                                            '${subTestList[index].split("_").first}',
                                            style: TextStyle(
                                                fontFamily: 'Arial',
                                                fontSize: 20,
                                                color: const Color(0xff08080a),
                                                fontWeight: FontWeight.bold
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(icon: Icon(Icons.delete,color: Colors.red,size: 30,), onPressed: (){
                                                deletingTests(subTestList[index]).whenComplete(() {
                                                  print("OK DELETED");
                                                  subTestList.clear();
                                                  gettingSubTestsData().whenComplete((){
                                                    Navigator.pop(context);
                                                    Navigator.of(context).push(ScaleRoute(page: history()));
                                                  });
                                                });
                                            }),
                                            Container(
                                              width: 100,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color:  Color(0xff01182a),
                                              ),
                                              child: FlatButton(
                                                child: Text('VIEW',style: TextStyle( fontFamily: 'Javanese Text', fontSize: 15,fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                                                ),
                                                onPressed: (){
                                                  savedTest = subTestList[index];
                                                  gettingSubTestsKeys(savedTest).whenComplete((){
                                                    Navigator.of(context).push(ScaleRoute(page: savedResults()));
                                                  });

                                                },
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),

                        ],
                      );
                    }
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
