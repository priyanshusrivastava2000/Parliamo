import 'package:flutter/material.dart';
import 'package:parliamo/functions/fetch.dart';
class profilePage extends StatefulWidget {
  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
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
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  'MY PROFILE',
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
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xff0e779a),width: 4),
                    image: DecorationImage(
                      image: NetworkImage(photoUrl),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
               SizedBox(height: 40,),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Container(

                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(20),
                     border: Border.all(color: Color(0xff0e779a),width: 5),
                     color: Colors.white
                   ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Container(
                                 child: Text('NAME: ', style: TextStyle(
                                     fontFamily: 'Constantia',
                                     fontSize: 20,
                                     color: const Color(0xff08080a),
                                     fontWeight: FontWeight.bold
                                 ),),
                               ),
                             ),
                             Container(
                               child: Text(name,style: TextStyle(
                                   fontFamily: 'Arial',
                                    fontSize: 15,
                                   color: const Color(0xff08080a),

                               ))
                             )
                           ],
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Container(
                                 child: Text('EMAIL: ',textAlign: TextAlign.right, style: TextStyle(
                                     fontFamily: 'Constantia',
                                     fontSize: 20,
                                     color: const Color(0xff08080a),
                                     fontWeight: FontWeight.bold
                                 ),),
                               ),
                             ),
                             Container(
                               child: Text(email,style: TextStyle(
                                   fontFamily: 'Arial',
                                    fontSize: 15,
                                   color: const Color(0xff08080a),

                               )),

                             )
                           ],
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Container(
                                 child: Text('CREATED ON: ', style: TextStyle(
                               fontFamily: 'Constantia',
                               fontSize: 20,
                               color: const Color(0xff08080a),
                               fontWeight: FontWeight.bold
                         ),),
                               ),
                             ),
                             Container(
                               child: Text(createdOn.split('.').first,style: TextStyle(
                                   fontFamily: 'Arial',

                                   color: const Color(0xff08080a),

                               )),
                             )
                           ],
                         ),
                       ),

                     ],
                   ),
                 ),
               )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
