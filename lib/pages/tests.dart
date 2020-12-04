import 'package:flutter/material.dart';
import 'package:parliamo/functions/fetch.dart';
import 'package:parliamo/pages/testpage1.dart';
import 'package:parliamo/pages/testpage2.dart';
import 'package:parliamo/pages/testpage3.dart';

class tests extends StatefulWidget {
  @override
  _testsState createState() => _testsState();
}

class _testsState extends State<tests> {
  bool progress;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
        child: Scaffold(
          backgroundColor: const Color(0xffeef9f9),
          appBar: AppBar(
            backgroundColor: Color(0xff0e779a),
            title: Text('TAKE CARE',style: TextStyle(color: Colors.white,fontSize: 25)),
            centerTitle: true,
            bottom: TabBar(
              unselectedLabelColor: Colors.white,

              tabs: [
                Tab(child: Row(
                  children: <Widget>[
                    new Container(
                      height: 30.00,
                      width: 30.00,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/az.png"),
                        ),
                      ),
                    ),
                    new Text(
                      "Sort by \nAlphabet",
                      style: TextStyle(
                        fontFamily: "Franklin Gothic",fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color:Color(0xfff9ffff),
                      ),
                    )
                  ],
                ),
                ),
                Tab(child: Row(
                  children: <Widget>[
                    new Container(
                      height: 30.00,
                      width: 25.00,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("images/conditions.png"),
                        ),
                      ),
                    ),
                    new Text(
                      "Sort by \nConditions",
                      style: TextStyle(
                        fontFamily: "Franklin Gothic",fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color:Color(0xfff9ffff),
                      ),
                    )
                  ],
                ),
                ),
                Tab(
                  child: Row(
                    children: <Widget>[
                      new Container(
                        height: 30.00,
                        width: 30.00,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("images/doctor.png"),
                          ),
                        ),
                      ),
                      new Text(
                        "Sort by \nSpeciality",
                        style: TextStyle(
                          fontFamily: "Franklin Gothic",fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color:Color(0xfff9ffff),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
              children: [
                testAlpha(),
                testBeta(),
                testGamma(),
              ]),
        )
    );
  }
}
