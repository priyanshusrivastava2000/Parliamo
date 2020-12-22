import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:parliamo/functions/deleteFunctions.dart';
import 'package:parliamo/functions/fetch.dart';
import 'package:parliamo/functions/transitionAnimation.dart';
import 'package:parliamo/pages/diagnosis.dart';
import 'package:parliamo/pages/history.dart';
import 'package:parliamo/pages/lifecycleDisorder.dart';
import 'package:parliamo/pages/testpage1.dart';
import 'package:parliamo/pages/tests.dart';
String displayName;
class disorder{
  disorder({
    this.headerValue,
    this.colour,
    this.image
});
  AssetImage image;
  Color colour;
  String headerValue;
}
List<disorder> disorderList = <disorder>[
  disorder(headerValue: 'Liver',colour: Color(0xfffb8277),image: AssetImage('images/whiteLiver.png')),
  disorder(headerValue: 'Kidney',colour: Color(0xffff812a),image: AssetImage('images/whiteKidney.png')),
  disorder(headerValue: 'Lungs',colour: Color(0xff37c3a4),image: AssetImage('images/whitelungs.png')),
  disorder(headerValue: 'CBC',colour: Color(0xffffd64d),image: AssetImage('images/whiteRBC.png')),
  disorder(headerValue: 'Allergy',colour: Color(0xffa8a8a8),image: AssetImage('images/whiteAllergy.png'))
];
class home extends StatefulWidget {
  @override
  homeDemo createState() => homeDemo();
}



class homeDemo extends State<home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    deletingTests('DIABETES SCREEN_(2020-12-22 11:42:49.979392)') ;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffeef9f9),
        appBar: AppBar(
          backgroundColor: Color(0xff0e779a),
          title: Text('TAKE CARE',style: TextStyle(color: Colors.white,fontSize: 25)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Transform.translate(
                offset: Offset(-100.0, 25.0),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontFamily: 'Franklin Gothic',
                      fontSize: 30,
                      color: const Color(0xff000000),
                    ),
                    children: [
                      TextSpan(
                        text: 'Hi, ${displayName.split(" ").first} \n',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: 'here at your care',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 20,
                          color: const Color(0xff567777),
                          fontWeight: FontWeight.w700,
                        ),
                      )

                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 50,),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Lifecycle Disorder',
                      style: TextStyle(
                        fontFamily: 'Constantia',
                        fontSize: 23,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                child: Swiper(itemCount: disorderList.length,
                  layout: SwiperLayout.CUSTOM,
                  customLayoutOption: CustomLayoutOption(startIndex: 0,stateCount: 3)
                      .addRotate([0.0 / 180, 0.0, 0.0 / 180]).addTranslate([
                    new Offset(-260.0, 0.0),
                    new Offset(0, 0.0),
                    new Offset(260.0, 0.0) //for right element
                  ]).addOpacity([0.5,1,0.5]),
                  scale: 1.1,
                  itemHeight: 180,
                  itemWidth: 250,

                  autoplay: true,
                  autoplayDelay: 4000,
                  itemBuilder: (BuildContext context,int index){
                            return GestureDetector(
                              child: Container(
                                height: 20,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25.0),
                                  color: disorderList[index].colour,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        child: new Container(
                                          height: 125.00,
                                          width: 192.00,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: disorderList[index].image,
                                            ),
                                          ),
                                        ),
                                        alignment: Alignment.centerLeft,
                                      ),
                                    ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: Align(
                                      child: Text(
                                          '${disorderList[index].headerValue}',
                                          style: TextStyle(
                                            fontFamily: 'Bookman Old Style',
                                            fontSize: 30,
                                            color: const Color(0xffffffff),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      alignment: Alignment.centerRight,
                                    ),
                                  )
                                  ],
                                ),
                              ),
                              onTap: (){
                                setState(() {
                                  organ = disorderList[index].headerValue;
                                });
                                Navigator.of(context).push(ScaleRoute(page: lifeCycleDIsorder()));
                              },
                            );
                        },
                ),
              ),
              SizedBox(height: 35,),
              Column(
                children: <Widget>[

                  FlatButton(

                    child: Container(
                      width: 320,
                      height: 140,
                        decoration: BoxDecoration(
                          color: Color(0xff01182a),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left:15.0),
                            child: Align(
                              child: Text(
                                'ADD REPORTS',
                                style: TextStyle(
                                  fontFamily: 'Javanese Text',
                                  fontSize: 24,
                                  color: const Color(0xffffffff),
                                ),
                                textAlign: TextAlign.left,
                              ),
                              alignment: Alignment.bottomLeft,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Container(
                              height: 125.00,
                              width: 110.00,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/reports.png'),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    onPressed: (){
                      Navigator.of(context).push(ScaleRoute(page: tests()));
                    },
                  ),
                  SizedBox(height: 25,),
                  FlatButton(

                    child: Container(
                      width: 320,
                      height: 140,
                      decoration: BoxDecoration(
                          color: Color(0xff01182a),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left:15.0),
                            child: Align(
                              child: Text(
                                'DIAGNOSIS',
                                style: TextStyle(
                                  fontFamily: 'Javanese Text',
                                  fontSize: 24,
                                  color: const Color(0xffffffff),
                                ),
                                textAlign: TextAlign.left,
                              ),
                              alignment: Alignment.bottomLeft,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Container(
                              height: 125.00,
                              width: 110.00,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/diagnose.png'),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    onPressed: (){
                    Navigator.of(context).push(ScaleRoute(page: diagnosis()));
                    },
                  ),
                  SizedBox(height: 25,),
                  FlatButton(

                    child: Container(
                      width: 320,
                      height: 140,
                      decoration: BoxDecoration(
                          color: Color(0xff01182a),
                          borderRadius: BorderRadius.circular(25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left:15.0),
                            child: Align(
                              child: Text(
                                'HISTORY',
                                style: TextStyle(
                                  fontFamily: 'Javanese Text',
                                  fontSize: 24,
                                  color: const Color(0xffffffff),
                                ),
                                textAlign: TextAlign.left,
                              ),
                              alignment: Alignment.bottomLeft,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Container(
                              height: 125.00,
                              width: 110.00,
                              child: Icon(Icons.history,size: 80,color: Colors.white,),
                            ),
                          )
                        ],
                      ),
                    ),
                    onPressed: (){
                      gettingSubTestsData().whenComplete((){
                        Navigator.of(context).push(ScaleRoute(page: history()));
                      });
                    },
                  ),
                  SizedBox(height: 25,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

