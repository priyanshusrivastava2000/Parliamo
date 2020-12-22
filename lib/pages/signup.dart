import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parliamo/functions/database.dart';
import 'package:parliamo/functions/signInGoogle.dart';

import 'package:parliamo/pages/login.dart';
final signUpformKey = GlobalKey<FormState>();
class signupPage extends StatefulWidget {
  @override
  _signupPageState createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  var progress = true;
  final auth = FirebaseAuth.instance;
  var email, password, fullName;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff0e779a),
        body: Form(
          key: signUpformKey,
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Transform.translate(
                  offset: Offset(0.0, 55.0),
                  child: Container(
                    width: 414.0,
                    height: 760.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(47.0),
                      color: const Color(0xffeef9f9),
                      border: Border.all(width: 1.0, color: const Color(0xff707070)),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(28.0, 129.0),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 54,
                    runSpacing: 28,
                    children: [{}].map((map) {
                      return Transform.translate(
                        offset: Offset(5.0, 4.0),
                        child: SizedBox(
                          width: 186.0,
                          height: 20.0,
                          child: Stack(
                            children: <Widget>[
                              Text(
                                'Good to see you start ',
                                style: TextStyle(
                                  fontFamily: 'Franklin Gothic',
                                  fontSize: 18,
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
                Transform.translate(
                  offset: Offset(23.0, 181.0),
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
                  offset: Offset(101.0, 187.0),
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
                  offset: Offset(184.0, 186.0),
                  child:
                  // Adobe XD layer: 'g copy' (shape)
                  GestureDetector(
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: const AssetImage('images/google.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    onTap: (){
                      try{
                        signInWithGoogle(context);
                      }
                      catch(e)
                      {
                        print(e);
                      }
                    },
                  ),
                ),
                Transform.translate(
                  offset: Offset(33.0, 589.0),
                  child: FlatButton(
                    child: Container(
                      width: 316.0,
                      height: 47.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: const Color(0xff030f1b),
                        border: Border.all(width: 1.0, color: const Color(0xff707070)),
                      ),
                      child: (progress)?Align(alignment: Alignment.center,child: Text('SIGN UP',style: TextStyle(  fontFamily: 'Javanese Text',
                        fontSize: 25,
                        color: const Color(0xffffffff),),textAlign: TextAlign.center,)):Center(child: CircularProgressIndicator(),)
                    ),
                    onPressed: () async {
                      if(signUpformKey.currentState.validate()){
                          setState(() {
                            progress = false;
                          });
                        signUpformKey.currentState.save();
                        try{
                          final newUser =await auth
                              .createUserWithEmailAndPassword(email: email, password: password);
                          User user =newUser.user;
                          await UserData(uid: user.uid).userData(fullName, email, password);
                          if(newUser!=null){
                            Fluttertoast.showToast(msg: "SIGN UP SUCCESSFUL",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.BOTTOM,
                            fontSize: 15.0,textColor: Colors.black,);
                            Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => loginScreen()));
                          }

                        }
                        catch(e){
                          setState(() {
                            progress = true;
                          });
                          if(e is PlatformException)
                            {
                              if(e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
                                Fluttertoast.showToast(msg: "ALREADY REGISTERED",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  fontSize: 15.0,);
                              }
                              if(e.code == 'ERROR_WEAK_PASSWORD') {
                                Fluttertoast.showToast(msg: "WEAK PASSWORD",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  fontSize: 15.0,);
                              }
                              if(e.code == 'ERROR_INVALID_EMAIL') {
                                Fluttertoast.showToast(msg: "INVALID EMAIL",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  fontSize: 15.0,);
                              }
                            }

                        }
                      }
                    },
                  ),
                ),
                Transform.translate(
                  offset: Offset(28.0, 94.0),
                  child: SizedBox(
                    width: 243.0,
                    height: 33.0,
                    child: SingleChildScrollView(
                        child: Text(
                          'Getting Started\n',
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
                  offset: Offset(50.0, 289.0),
                  child: Container(
                    width: 316.0,
                    height: 47.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: const Color(0xffffffff),
                      border: Border.all(width: 1.0, color: const Color(0xff707070)),
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 50,
                        ),
                        Flexible(child: TextFormField(
                          maxLines: 1,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText:'Email',
                              hintStyle:TextStyle(color: Color(0xFFB5B4B7),fontSize: 19)
                          ),
                          onChanged: (value){
                            email = value;
                          },
                        ))
                      ],
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(49.0, 390.0),
                  child: Container(
                    width: 316.0,
                    height: 47.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: const Color(0xffffffff),
                      border: Border.all(width: 1.0, color: const Color(0xff707070)),
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 50,
                        ),
                        Flexible(child: TextFormField(
                          maxLines: 1,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText:'Full Name',
                              hintStyle:TextStyle(color: Color(0xFFB5B4B7),fontSize: 19)
                          ),
                          onChanged: (value){
                            fullName = value;
                          },
                        ))
                      ],
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(49.0, 491.0),
                  child: Container(
                    width: 316.0,
                    height: 47.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: const Color(0xffffffff),
                      border: Border.all(width: 1.0, color: const Color(0xff707070)),
                    ),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 50,
                        ),
                        Flexible(child: TextFormField(
                          maxLines: 1,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText:'Password',
                              hintStyle:TextStyle(color: Color(0xFFB5B4B7),fontSize: 19)
                          ),
                          onChanged: (value){
                            password = value;
                          },
                        ))
                      ],
                    ),
                  ),
                ),

                Transform.translate(
                  offset: Offset(63.0, 295.0),
                  child: Container(
                    width: 32.0,
                    height: 32.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('images/email.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(62.0, 399.0),
                  child: Container(
                    width: 34.0,
                    height: 34.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('images/firstName.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(64.0, 495.0),
                  child: Container(
                    width: 35.0,
                    height: 38.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('images/password.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(83.0, 649.0),
                  child: Container(
                    child: Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontFamily: 'Arial Unicode MS',
                        fontSize: 15,
                        color: const Color(0xff000000),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(270.0, 648.0),
                  child: Container(
                    child: GestureDetector(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Arial',
                          fontSize: 16,
                          color: const Color(0xfffa0000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => loginScreen()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


