import 'package:flutter/material.dart';
import 'package:parliamo/functions/fetch.dart';
import 'package:parliamo/pages/testByCondition.dart';
class addTest extends StatefulWidget {
  @override
  _addTestState createState() => _addTestState();
}

class _addTestState extends State<addTest> {
 height(){

 }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: (){
          parameterList.clear();
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
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      child: TextField(
                                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),

                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 2)
                                      ),
                                      height: 30,
                                    ),
                                  ),
                                )
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
                          child: Text('SUBMIT',style: TextStyle( fontFamily: 'Javanese Text', fontSize: 20,fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
                          ),
                          onPressed: (){

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
    );
  }
}
