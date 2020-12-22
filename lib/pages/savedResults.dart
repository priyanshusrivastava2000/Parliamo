import 'package:flutter/material.dart';
import 'package:parliamo/functions/fetch.dart';
import 'package:parliamo/functions/resultsPDF.dart';
import 'package:parliamo/pages/history.dart';
class savedResults extends StatefulWidget {
  @override
  _savedResultsState createState() => _savedResultsState();
}


class _savedResultsState extends State<savedResults> {
  bool progress=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(savedResultsKeys);
    print(savedResultsValues);
    if(savedResultsValues.contains("Positive") || savedResultsValues.contains("Negative"))
      {
        setState(() {
          progress = true;
        });

      }
    else{
      gettingResults(savedResultsKeys.first, savedTest.split("_").first,double.parse(savedResultsValues.first)).whenComplete((){
        setState(() {
          progress = true;
        });
      });

    }
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        savedResultsKeys.clear();
        savedResultsValues.clear();
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
              savedResultsKeys.clear();
              savedResultsValues.clear();
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'REPORT',
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
                          '${savedTest.split("_").first}',
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
                    Divider(thickness: 3,color: Colors.black,),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: savedResultsKeys.length,
                        itemBuilder: (BuildContext context,int index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    '${savedResultsKeys[index]}: ',
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
                                Container(
                                  child: Text(
                                    '${savedResultsValues[index]}\n ${(result!=null)?result.toUpperCase():""}',
                                    style: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: 25,
                                      color: const Color(0xff08080a),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),

                                )
                              ],
                            ),
                          );
                        }),

                  ],
                ),
              ),
              (progress)?Container(width:380,child: resultsPDF(testName: savedTest.split("_").first,result: result,)):Center(child: CircularProgressIndicator(),)
            ],
          ),
        ),
      ),
    );
  }
}
