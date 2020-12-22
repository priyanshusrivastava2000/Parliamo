import 'package:flutter/material.dart';
class aboutUs extends StatefulWidget {
  @override
  _aboutUsState createState() => _aboutUsState();
}

class _aboutUsState extends State<aboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeef9f9),
      appBar: AppBar(
        backgroundColor: Color(0xff0e779a),
        title: Text('TAKE CARE',style: TextStyle(color: Colors.white,fontSize: 25)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  'ABOUT US',
                  style: TextStyle(
                    fontFamily: 'Constantia',
                    fontSize: 35,
                    color: const Color(0xff08080a),
                    fontWeight: FontWeight.bold,
                  ),

                ),
              ),
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 300,
              height: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/team.png'),
                  fit: BoxFit.fill
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
