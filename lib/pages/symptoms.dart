import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parliamo/functions/fetch.dart';
import 'package:parliamo/functions/transitionAnimation.dart';
import 'package:parliamo/pages/diagnoseResult.dart';
import 'package:parliamo/pages/diagnosis.dart';
class symptoms extends StatefulWidget {
  @override
  _symptomsState createState() => _symptomsState();
}
class radioButton{
  radioButton({
    this.value,
    this.tag,
    this.count
});
  bool value;
  String tag;
  int count;
}
class _symptomsState extends State<symptoms> {
  bool progress;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettingDiagnose(symptomSelected).whenComplete((){
      setState(() {
        progress = true;
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
          boolList.clear();
          symptomList.clear();
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
              symptomList.clear();
              boolList.clear();
              Navigator.pop(context);
            },
          ),
        ),
        body: (progress == true)?Container(
          child: SingleChildScrollView(

            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 15.0),
                  child: Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child:Text(
                        '${symptomSelected.toUpperCase()}',
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
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0,bottom: 8.0),
                  child: Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child:Text(
                        'Choose Symptoms you are Suffering With',
                        style: TextStyle(
                          fontFamily: 'Constantia',
                          fontSize: 17,
                          color: const Color(0xff476e6f),
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
               ListView.builder(
                 itemCount:  boolList.length,
                 shrinkWrap: true,
                   physics: NeverScrollableScrollPhysics(),
                   itemBuilder: (BuildContext context,int index){
                      return InkWell(
                        splashColor: Colors.transparent,
                        onTap: (){
                          boolList[index].count = boolList[index].count + 1;
                          setState(() {
                            if(boolList[index].count.isOdd)
                              {
                                boolList[index].value = true;
                              }
                            else
                              {
                                boolList[index].value = false;
                              }
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: 15.0
                                ),
                                child: Text(
                                  '${boolList[index].tag}',
                                  style: TextStyle(
                                    fontFamily: 'Franklin Gothic',
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: (boolList[index].value)? Color(0xff0e779a) : Colors.transparent,
                                  border: Border.all(width: 2.0,
                                  color: boolList[index].value ? Color(0xff0e779a):Colors.grey),
                                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                   }),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.center,
                  child: FlatButton(
                    child: Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xff0e779a),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'NEXT',
                          style: TextStyle(
                            fontFamily: 'Constantia',
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    onPressed: (){
                        for(int i=0;i<boolList.length;i++)
                          {
                            if(boolList[i].value == true)
                              {
                                  selectedSymptomList.add(boolList[i].tag);
                              }
                          }
                        boolList.clear();
                        symptomList.clear();
                        successiveSymptoms(symptomSelected,selectedSymptomList).whenComplete((){
                          selectedSymptomList.clear();
                          Navigator.pop(context);
                          Navigator.of(context).push(ScaleRoute(page: diagnoseResult()));
                        });
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
        ):Center(child: CircularProgressIndicator(),)
      ),
    );
  }
}
