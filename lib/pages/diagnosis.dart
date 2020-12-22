import 'package:flutter/material.dart';
import 'package:parliamo/functions/fetch.dart';
import 'package:parliamo/functions/transitionAnimation.dart';
import 'package:parliamo/pages/symptoms.dart';

class diagnosis extends StatefulWidget {
  @override
  _diagnosisState createState() => _diagnosisState();
}
String symptomSelected;
class _diagnosisState extends State<diagnosis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeef9f9),
      appBar: AppBar(
        backgroundColor: Color(0xff0e779a),
        title: Text('TAKE CARE',style: TextStyle(color: Colors.white,fontSize: 25)),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0,top: 15.0),
              child: Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child:Text(
                    'DIAGNOSIS',
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
                    'Choose a Symptom you are Suffering With',
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
            GridView.builder(
              shrinkWrap: true,
              itemCount: displayDiagnosis.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10
              ),
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.transparent,
                      border: Border.all(width: 3,color: Colors.black26)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(child: Column(
                        children: [
                          Container(

                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/'+'${displayDiagnosis[index]}'+'.png'),
                                fit: BoxFit.fill
                              )
                            ),
                            height: 140,
                          ),
                          Align(alignment: Alignment.bottomCenter,child: Text('${displayDiagnosis[index]}',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)),
                        ],
                      ),
                        onPressed: (){
                          setState(() {
                            symptomSelected = displayDiagnosis[index];
                          });
                          Navigator.of(context).push(ScaleRoute(page: symptoms()));
                        },),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );

  }
}
