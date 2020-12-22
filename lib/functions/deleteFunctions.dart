import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parliamo/functions/fetch.dart';

Future<String> deletingTests(String test) async {

  try{
    var user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance
        .collection('Users')
        .doc(user.uid)
        .collection('SubUsers').doc(currentSubUser).collection('Tests').doc(test).delete();

  }
  catch(e){
    print(e);
  }
}