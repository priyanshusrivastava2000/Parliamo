import 'package:flutter/material.dart';
import 'package:parliamo/functions/database.dart';
import 'package:parliamo/functions/fetch.dart';
import 'package:parliamo/functions/transitionAnimation.dart';
import 'package:parliamo/homedemo.dart';
import 'package:parliamo/pages/results.dart';

import 'package:parliamo/pages/testByCondition.dart';

class addTest extends StatefulWidget {
  @override
  _addTestState createState() => _addTestState();
}

var testDataMap = Map();
class _addTestState extends State<addTest> {
  bool progress =true;
  var resultSet = new Set();
  List<String> selection = ["Positive","Negative"];
  String selected;
  List<String>testDataMapValues=<String>[];
  List<String>testDataMapKeys=<String>[];
  final addReportsKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: (){
          parameterList.clear();
          rangeValues.clear();
          testName = "";
          Navigator.pop(context);
        },
      child: Scaffold(
        backgroundColor: const Color(0xffeef9f9),
        appBar: AppBar(
          backgroundColor: Color(0xff0e779a),
          title: Text('TAKE CARE',style: TextStyle(color: Colors.white,fontSize: 25)),
          centerTitle: true,
          leading: BackButton(
            onPressed: (){
                parameterList.clear();
                rangeValues.clear();
              Navigator.pop(context);
            },
          ),

        ),
        body: Form(
          key: addReportsKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ADD RESULT',
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
                  width: 380,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xff707070),width: 3.0),
                    color: Color(0xffffffff),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '$testName',
                            style: TextStyle(
                              fontFamily: 'Constantia',
                              fontSize: 25,
                              color: const Color(0xff08080a),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: parameterList.length,
                          itemBuilder: (BuildContext context,int index){
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                 Container(
                                   child: Text(
                                     '${parameterList[index]}: ',
                                     style: TextStyle(
                                       fontFamily: 'Constantia',
                                       fontSize: 20,
                                       color: const Color(0xff08080a),
                                       fontWeight: FontWeight.w700,
                                     ),
                                     textAlign: TextAlign.left,
                                   ),
                                   width: 190,
                                 ),
                                  ( rangeValues[index] !="Positive/Negative")?Expanded(
                                    child: Container(

                                      child: TextFormField(
                                        keyboardType: TextInputType.numberWithOptions(decimal: true),

                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          errorStyle: TextStyle(fontSize: 10),

                                        ),

                                        validator: (value){
                                          if(rangeValues[index]!= null || rangeValues[index]!="Positive/Negative")
                                            {
                                              print("v1" + value);
                                              print(double.parse(value));
                                              print(double.parse(rangeValues[index].replaceAll(" ","").split('-')[1]));
                                              print(double.parse(rangeValues[index].replaceAll(" ","").split('-')[0]));
                                              if(double.parse(value)<=double.parse(rangeValues[index].replaceAll(" ","").split('-')[0]) || double.parse(value)>=double.parse(rangeValues[index].replaceAll(" ","").split('-')[1]))
                                                {
                                                  print("OK");

                                                  return 'Value should be between ${rangeValues[index].replaceAll(" ","").split('-')[0]} and \n ${rangeValues[index].replaceAll(" ","").split('-')[1]}';
                                                }
                                            }
                                            return null;
                                        },
                                        onChanged: (value){

                                          testDataMap[parameterList[index]]=value;

                                          },


                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 2)
                                      ),
                                      height: 56,
                                    ),
                                  ):  Flexible(
                                      child: DropdownButton(
                                        value: selected,
                                        onChanged: (value){
                                          setState(() {
                                            selected = value;
                                            testDataMap[parameterList[index]]=value;
                                          });
                                        },
                                        items: selection.map((e){
                                          return DropdownMenuItem(
                                            child: new Text(e,style: TextStyle(fontSize: 20),),
                                            value: e,
                                          );
                                        }).toList(),
                                      )
                                  ),
                                ],
                              ),
                            );
                          }),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:  Color(0xff01182a),
                          ),
                          child: FlatButton(
                            child: (progress)?Text('SUBMIT',style: TextStyle( fontFamily: 'Javanese Text', fontSize: 20,fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                            )
                                :Center(child: CircularProgressIndicator(),),
                            onPressed: () async {
                                if(addReportsKey.currentState.validate()) {
                                  setState(() {
                                    progress = false;
                                  });

                                  print(testDataMap);

                                  addReportsKey.currentState.save();


                                      await TestsData().testData(testName);

                                      if(testDataMap.length==1)
                                      {
                                        print("IF");
                                        testDataMap.forEach((key, value) {

                                          print(value);
                                          print(key);
                                          print(testName);
                                          try{
                                            gettingResults(key,testName,double.parse(value)).then((value)
                                            {
                                              if(result == "Low")
                                              {
                                                setState(() {
                                                  Navigator.pop(context);
                                                  Navigator.of(context).push(ScaleRoute(page: results(colour: Colors.red,image: AssetImage('images/sad.png'),careLine: "YOU ARE AT RISK",reportType:'UNSTABLE REPORT',result: result,)));
                                                });
                                              }
                                              if(result == "High")
                                              {
                                                setState(() {
                                                  Navigator.pop(context);
                                                  Navigator.of(context).push(ScaleRoute(page: results(colour: Colors.red,image: AssetImage('images/sad.png'),careLine:"YOU ARE AT RISK",reportType:'UNSTABLE REPORT',result: result,)));
                                                });
                                              }
                                              if(result == "Normal")
                                              {
                                                setState(() {
                                                  Navigator.pop(context);
                                                  Navigator.of(context).push(ScaleRoute(page: results(colour: Colors.green,image: AssetImage('images/greenSmiley.png'),careLine:"YOU ARE HEALTHY",reportType:'STABLE REPORT',result: result,)));
                                                });
                                              }
                                              if(result == "Border")
                                              {
                                                setState(() {
                                                  Navigator.pop(context);
                                                  Navigator.of(context).push(ScaleRoute(page: results(colour: Colors.yellow,image: AssetImage('images/neutral.png'),careLine:"YOU NEED PRECAUTIONS",reportType:'BORDER LINE REPORT',result: result,)));
                                                });
                                              }
                                              if(result == null)
                                                {
                                                  setState(() {
                                                    Navigator.pop(context);
                                                    Navigator.of(context).push(ScaleRoute(page: home()));
                                                  });
                                                }
                                            });
                                          }
                                         catch(e)
                                          {
                                            print(e);
                                          }

                                          }

                                        );
                                      }
                                     else{
                                       print("else");
                                       for(var v in testDataMap.entries){
                                         testDataMapKeys.add(v.key);
                                         testDataMapValues.add(v.value);
                                       }

                                       for(int i =0 ;i<testDataMapKeys.length;i++)
                                         {
                                           print(testDataMapValues[i]);
                                           if(testDataMapValues[i] != "Positive" || testDataMapValues[i] != "Negative")
                                             {
                                               try
                                               {
                                                 await gettingResults(testDataMapKeys[i], testName,double.parse(testDataMapValues[i]));
                                                 print(result);
                                                 resultSet.add(result);
                                                 print(resultSet.length);
                                               }
                                              catch(e)
                                                {
                                                  setState(() {
                                                    progress = true;
                                                  });
                                                }
                                             }
                                         }

                                      }
                                     print(resultSet);
                                  testDataMap.clear();
                                  parameterList.clear();
                                  rangeValues.clear();
                                  if(resultSet.isNotEmpty)
                                    {
                                      if(resultSet.contains("High"))
                                      {
                                        setState(() {
                                          Navigator.pop(context);
                                          Navigator.of(context).push(ScaleRoute(page: results(colour: Colors.red,image: AssetImage('images/sad.png'),careLine:"YOU ARE AT RISK",reportType:'UNSTABLE REPORT',result: resultSet.first,)));
                                        });
                                      }
                                      if(resultSet.contains("Low"))
                                      {
                                        setState(() {
                                          Navigator.pop(context);
                                          Navigator.of(context).push(ScaleRoute(page: results(colour: Colors.red,image: AssetImage('images/sad.png'),careLine: "YOU ARE AT RISK",reportType:'UNSTABLE REPORT',result: resultSet.first,)));
                                        });
                                      }
                                      if(resultSet.contains("Normal"))
                                      {
                                        setState(() {
                                          Navigator.pop(context);
                                          Navigator.of(context).push(ScaleRoute(page: results(colour: Colors.green,image: AssetImage('images/greenSmiley.png'),careLine:"YOU ARE HEALTHY",reportType:'STABLE REPORT',result: resultSet.first,)));
                                        });
                                      }
                                      if(resultSet.contains("Border"))
                                      {
                                        setState(() {
                                          Navigator.pop(context);
                                          Navigator.of(context).push(ScaleRoute(page: results(colour: Colors.yellow,image: AssetImage('images/neutral.png'),careLine:"YOU NEED PRECAUTIONS",reportType:'BORDER LINE REPORT',result: resultSet.first,)));
                                        });
                                      }
                                    }

                                }
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
