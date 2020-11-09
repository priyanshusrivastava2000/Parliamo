import 'package:flutter/material.dart';

import 'package:adobe_xd/page_link.dart';


class starterPage extends StatelessWidget {
  starterPage({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffdef7f8),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(-990.0, 111.0),
            child: Container(
              width: 418.0,
              height: 57.0,
              decoration: BoxDecoration(
                color: const Color(0xff0e779a),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(-859.0, 798.0),
            child: Container(
              width: 204.0,
              height: 152.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: const Color(0xffa8a8a8),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(104.3, 130.3),
            child: Transform.rotate(
              angle: 0.0,
              child:
                  // Adobe XD layer: 'tc logo ny copy' (shape)
                  Container(
                width: 206.0,
                height: 244.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage(''),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Container(),
          Container(),
          Transform.translate(
            offset: Offset(176.0, 506.0),
            child: Text(
              'LOGIN',
              style: TextStyle(
                fontFamily: 'Franklin Gothic',
                fontSize: 29,
                color: const Color(0xff2f2faf),
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(168.0, 690.0),
            child: Text(
              'SIGNUP',
              style: TextStyle(
                fontFamily: 'Franklin Gothic',
                fontSize: 29,
                color: const Color(0xff1e1eb4),
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
