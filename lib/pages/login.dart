import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parliamo/functions/database.dart';
import 'package:parliamo/functions/fetch.dart';
import 'package:parliamo/functions/signInGoogle.dart';
import 'package:parliamo/functions/transitionAnimation.dart';
import 'package:parliamo/pages/addUsers.dart';
import 'package:parliamo/pages/signup.dart';
GlobalKey<FormState> loginformKey = GlobalKey<FormState>();
class loginScreen extends StatefulWidget {
  @override
  login createState() => login();
}
class login extends State<loginScreen>{
  var progress = true;
  final auth = FirebaseAuth.instance;
  var email,password;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff0e779a),
        body: Form(
          key: loginformKey,
          child: Stack(
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
                offset: Offset(28.0, 94.0),
                child: SizedBox(
                  width: 273.0,
                  height: 40.0,
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
                  )
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(28.0, 129.0),
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
                                'Get in for care ',
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
                offset: Offset(50.0, 389.0),
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
                        obscureText: true,
                        onChanged: (value){
                          password = value;
                        },
                      ))
                    ],
                  ),
                ),

              ),
              Transform.translate(
                offset: Offset(50.0, 490.0),
                child: Container(
                  width: 316.0,
                  height: 47.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: const Color(0xff030f1b),
                    border: Border.all(width: 1.0, color: const Color(0xff707070)),
                  ),
                  child: FlatButton(
                    color: Colors.transparent,
                    onPressed: () async {
                      if (loginformKey.currentState.validate()) {
                        setState(() {
                          progress = false;
                        });
                        loginformKey.currentState.save();
                        try{
                          final user = await auth.signInWithEmailAndPassword(email: email, password: password);

                          if(user!=null){
                            Fluttertoast.showToast(msg: "LOGIN SUCCESSFUL",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.BOTTOM,
                              fontSize: 15.0,textColor: Colors.black,);
                            Navigator.pop(context);
                            Navigator.of(context).push(ScaleRoute(page: usersPage()));
                          }
                        }
                      catch(e){
                          setState(() {
                            progress = true;
                          });
                          print(e);
                          Fluttertoast.showToast(msg: "INVALID CREDENTIAL",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            fontSize: 15.0,);
                      }
                      }
                    },
                    child: (progress)?Align(alignment: Alignment.center,child: Text('LOGIN',style: TextStyle( fontFamily: 'Javanese Text', fontSize: 25, color: const Color(0xffffffff)),textAlign: TextAlign.center,))
                        :CircularProgressIndicator()
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(60.0, 295.0),
                child: Container(
                  width: 30.0,
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
                offset: Offset(60.0, 395.0),
                child: Container(
                  width: 34.0,
                  height: 34.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('images/password.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(76.0, 550.0),
                child: Container(
                  child: Text(
                    'Don\'t Have an account?',
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
                offset: Offset(242.0, 549.0),
                child: Container(
                  child: GestureDetector(
                    child: Text(
                      'Signup',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 16,
                        color: const Color(0xfffa0000),
                        fontWeight: FontWeight.w800
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onTap: (){
                      Navigator.pop(context);
                      Navigator.of(context).push(ScaleRoute(page: signupPage()));
                    },
                  ),
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
                offset: Offset(184.0, 188.0),
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
                      onTap: () {
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
            ],
          ),
        ),
      ),
    );
  }
}
