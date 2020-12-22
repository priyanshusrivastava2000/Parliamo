import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:adobe_xd/page_link.dart';
import 'package:parliamo/functions/fetch.dart';
import 'package:parliamo/functions/transitionAnimation.dart';
import 'package:parliamo/pages/login.dart';
import 'package:parliamo/pages/signup.dart';


class starterPage extends StatelessWidget {
  starterPage({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffdef7f8),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [Color(0xffDEF7F8),Color(0xffB2F4F8),Color(0xff5BD5DB),Color(0xff38CBD2),Color(0xff1DB4B9),Color(0xff068F98)]
          )
        ),
        child: Stack(
          children: <Widget>[
            Transform.translate(
              offset: Offset(104.3, 130.3),
              child: Transform.rotate(
                angle: 0.0,
                child:
                    Container(
                  width: 206.0,
                  height: 244.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('images/logo.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Container(),
            Container(),
            Transform.translate(
              offset: Offset(70.0, 506.0),
              child: RaisedButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Container(
                  width: 240,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 10.0,
                      color: Colors.white
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(35.0))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontFamily: 'Franklin Gothic',
                        fontSize: 29,
                        color: const Color(0xff2f2faf),
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                elevation: 10,
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.of(context).push(ScaleRoute(page: loginScreen()));
                },
              ),
            ),
            Transform.translate(
              offset: Offset(70.0, 640.0),
              child: RaisedButton(
                hoverColor: Colors.white70,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Container(
                  width: 240,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                      border: Border.all(
                          width: 10.0,
                        color: Colors.white
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(35.0))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'SIGNUP',
                      style: TextStyle(
                        fontFamily: 'Franklin Gothic',
                        fontSize: 29,
                        color: const Color(0xff1e1eb4),
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                elevation: 10,
                onPressed: (){
                  Navigator.pop(context);
                  Navigator.of(context).push(ScaleRoute(page: signupPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
