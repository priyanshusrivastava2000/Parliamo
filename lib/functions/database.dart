import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parliamo/functions/fetch.dart';
import 'package:parliamo/pages/addReports.dart';

var user = FirebaseAuth.instance.currentUser;

class UserData{
  String uid;
  dynamic data;
  UserData({this.uid});
  final CollectionReference users = FirebaseFirestore.instance.collection('Users');
  Future userData(String fullname, String email, String password) async{
    try{
      await users.doc(uid).set({
        'name': fullname,
        'email': email,
        'password': password,

      });
    }
    catch(e){
      print(e);
    }
  }
}

class SubUsersData{
 SubUsersData({this.uid});
 String uid;
 final CollectionReference subUsers = FirebaseFirestore.instance.collection('Users').doc(user.uid).collection('SubUsers');
 Future subUserData(String fullName,String age,String bloodGroup,String weight,String relation,String gender)async{
   try{
     await subUsers.doc(relation).set({
       'name': fullName,
       'age': age,
       'BloodGroup': bloodGroup,
       'Gender': gender
     });
   }
   catch(e){
     print(e);
   }
 }
}
class TestsData{
  final CollectionReference subUsers = FirebaseFirestore.instance.collection('Users').doc(user.uid).collection('SubUsers').doc(currentSubUser).collection('Tests');

  Future testData(String testName)async{
    try{
      await subUsers.doc(testName + "_" +'(${DateTime.now()})').set(
        testDataMap.cast<String,String>()
      );
    }
    catch(e){
      print(e);
    }
  }
}

