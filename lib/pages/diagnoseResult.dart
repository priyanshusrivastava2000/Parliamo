

import 'package:flutter/material.dart';
import 'package:parliamo/functions/diagnosePDF.dart';
import 'package:parliamo/functions/fetch.dart';
import 'package:parliamo/functions/transitionAnimation.dart';
import 'package:parliamo/pages/diagnosis.dart';
class diagnoseResult extends StatefulWidget {
  @override
  _diagnoseResultState createState() => _diagnoseResultState();
}

class _diagnoseResultState extends State<diagnoseResult> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      showAlertDialog(context);
    });
  }

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
            diagnosisResult = "";
            Navigator.pop(context);
          },
        ),
      ),
      body: WillPopScope(
        onWillPop: (){
          diagnosisResult = "";
          Navigator.pop(context);
        },

        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child:Text(
                    'EXPECTED RESULT',
                    style: TextStyle(
                      fontFamily: 'Constantia',
                      fontSize: 25,
                      color: const Color(0xff08080a),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Text(
                diagnosisResult.toUpperCase(),
                style: TextStyle(
                  fontFamily: 'Franklin Gothic',
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30,),
              Container(width:380,child: diagnosePDF(result: diagnosisResult,))
            ],
          ),
        ),
      ),
    );
  }
}
showAlertDialog(BuildContext context) {

  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed:  () {
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.of(context).push(ScaleRoute(page: diagnosis()));
    },
  );
  Widget continueButton = FlatButton(
    child: Text("Continue"),
    onPressed:  () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      "DISCLAIMER",
      style: TextStyle(
        fontFamily: 'Franklin Gothic',
        fontSize: 30,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    ),
    content: Text("You are advised that the information provided by this tool is purely and solely intended for educational purposes. We do not claim and do not in any way state the data presented by the tool is a qualified medical opinion.The tool is designed to help you become more aware of your own health and concerns around it. Please note that the information presented by the tool on your health or medical condition is not be considered as an advice or opinion of a health expert or health professional. We advise you to consult a doctor for any symptoms you may be experiencing. In case of an emergency, please call your doctor/ advisor for immediate assistance."
    ),
    actions: [
      cancelButton,
      continueButton,
    ],

  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
    barrierDismissible: false
  );
}