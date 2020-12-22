import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:parliamo/functions/database.dart';
import 'package:parliamo/functions/transitionAnimation.dart';
import 'package:parliamo/pages/addUsers.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<String> signInWithGoogle(BuildContext context) async{
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult = await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  if (user != null) {
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);
    await UserData(uid: user.uid).userData(user.displayName, user.email, null);
    Fluttertoast.showToast(msg: "LOGIN SUCCESSFUL",toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.BOTTOM,
      fontSize: 15.0,textColor: Colors.black,);
    Navigator.pop(context);
    Navigator.of(context).push(ScaleRoute(page: usersPage()));
    print('signInWithGoogle succeeded: $user');

    return '$user';
  }

  return null;
}