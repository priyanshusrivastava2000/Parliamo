import 'package:flutter/material.dart';

class splashScreen extends StatelessWidget {
  splashScreen({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
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
            offset: Offset(-240.4, 197.4),
            child: Transform.rotate(
              angle: 1.5708,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('images/back.png'),
                    fit: BoxFit.fill,
                  ),
                ),
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
            offset: Offset(91.3, 161.3),
            child: Transform.rotate(
              angle: 0.0,
              child:
                  // Adobe XD layer: 'tc logo ny copy' (shape)
                  Container(
                width: 231.0,
                height: 274.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('images/logo.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
