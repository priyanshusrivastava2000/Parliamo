import 'package:flutter/material.dart';

class iPhoneXRXSMax117 extends StatelessWidget {
  iPhoneXRXSMax117({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0e779a),
      body: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0.0, 55.0),
            child: Container(
              width: 414.0,
              height: 882.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(47.0),
                color: const Color(0xffeef9f9),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(34.0, 187.0),
            child: SizedBox(
              width: 273.0,
              height: 25.0,
              child: SingleChildScrollView(
                  child: Text(
                'Let\'s Get something',
                style: TextStyle(
                  fontFamily: 'Franklin Gothic',
                  fontSize: 29,
                  color: const Color(0xff191a1a),
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.left,
              )),
            ),
          ),
          Transform.translate(
            offset: Offset(34.0, 226.0),
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 52,
                runSpacing: 26,
                children: [{}].map((map) {
                  return Transform.translate(
                    offset: Offset(5.0, 2.0),
                    child: SizedBox(
                      width: 207.0,
                      height: 22.0,
                      child: Stack(
                        children: <Widget>[
                          Text(
                            'Good to see you back ',
                            style: TextStyle(
                              fontFamily: 'Franklin Gothic',
                              fontSize: 20,
                              color: const Color(0xff476e6f),
                              fontWeight: FontWeight.w800,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(42.0, 383.0),
            child: Container(
              width: 316.0,
              height: 47.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(42.0, 506.0),
            child: Container(
              width: 316.0,
              height: 47.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: const Color(0xffffffff),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(42.0, 644.0),
            child: Container(
              width: 316.0,
              height: 47.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: const Color(0xff030f1b),
                border: Border.all(width: 1.0, color: const Color(0xff707070)),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(56.0, 390.0),
            child: Container(
              width: 34.0,
              height: 34.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(56.0, 509.0),
            child: Container(
              width: 35.0,
              height: 35.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage(''),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(76.0, 705.0),
            child: SizedBox(
              width: 176.0,
              height: 14.0,
              child: SingleChildScrollView(
                  child: Text(
                'Don\'t Have an account?',
                style: TextStyle(
                  fontFamily: 'Arial Unicode MS',
                  fontSize: 15,
                  color: const Color(0xff000000),
                ),
                textAlign: TextAlign.center,
              )),
            ),
          ),
          Transform.translate(
            offset: Offset(242.0, 708.0),
            child: SizedBox(
              width: 62.0,
              height: 19.0,
              child: Text(
                'Signup',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 16,
                  color: const Color(0xfffa0000),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(160.0, 641.0),
            child: Text(
              'LOGIN',
              style: TextStyle(
                fontFamily: 'Javanese Text',
                fontSize: 25,
                color: const Color(0xffffffff),
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Transform.translate(
            offset: Offset(20.0, 265.0),
            child:
                // Adobe XD layer: 'twitter copy' (shape)
                Container(
              width: 81.0,
              height: 68.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('images/tt.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(100.0, 273.0),
            child:
                // Adobe XD layer: 'fb' (shape)
                Container(
              width: 74.0,
              height: 52.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26.0),
                image: DecorationImage(
                  image: const AssetImage('images/fb.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(187.0, 266.0),
            child:
                // Adobe XD layer: 'g copy' (shape)
                Container(
              width: 70.0,
              height: 66.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('images/gplus.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
