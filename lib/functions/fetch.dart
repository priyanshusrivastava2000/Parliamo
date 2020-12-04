

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


List<String>nameList = <String>[];
List<String>ageList = <String>[];
List<String>relationList = <String>[];
List<String>genderList = <String>[];
List<String>alphabets=<String>["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
List<String>testByConditionList = <String>[];
List<String>parameterList = <String>[];

Future<String> gettingData() async {
  String username;
  try {
    var user = FirebaseAuth.instance.currentUser;
      var snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .get()
          .then((value) {
            value.data().forEach((key, value) {});

            username = value.data()["name"];
      });
  }
  catch (e) {
    print("error");
    print(e);
  }

  return username;
}

Future<String> gettingSubData() async {

  try{
    var user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(user.uid)
        .collection('SubUsers').get();
      final List<DocumentSnapshot> documents = snapshot.docs;
      documents.forEach((element)
      {relationList.add(element.id.toString());
      });
      print(relationList);
  }
  catch(e){
    print(e);
  }
}
Future<String> gettinginfo() async {
  try{
    var user = FirebaseAuth.instance.currentUser;
    for(int i=0;i<relationList.length;i++)
      {
        var snapshot = await FirebaseFirestore.instance
            .collection('Users')
            .doc(user.uid)
            .collection('SubUsers')
            .doc(relationList[i])
            .get()
            .then((value){
             nameList.add(value.data()['name'].toString());
             ageList.add(value.data()['age'].toString());
             genderList.add(value.data()['Gender'].toString());
        });
      }
  }
  catch(e)
  {
    print(e);
  }
}

Future<List<String>> gettingTests(String alphabets) async {
  List<String>tests= <String>[];

  try{

    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Tests')
        .get();
    final List<DocumentSnapshot> documents = snapshot.docs;
    documents.forEach((element)
    {
      if(element.id.startsWith(alphabets)==true)
        {
          tests.add(element.id.toString());
        }
    }
    );
    return tests;

  }
  catch(e){
    print("error :"+e.toString());
  }
}
Future<List<String>> gettingCategory(String alphabet) async {
  List<String> tests = <String>[];
  Set categorySet = new Set();
  List<String> categoryList = <String>[];
  try{
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Tests')
        .get();
    final List<DocumentSnapshot> documents = snapshot.docs;

    documents.forEach((element)
    {
      element.data().forEach((key, value) {
        if(key == "category"){
          if(value.toString().toUpperCase().startsWith(alphabet)){
            categorySet.add(value.toString());
          }
        }
      });
        tests.add(element.id.toString());
    }
    );

    categorySet.forEach((element) {
      categoryList.add(element);
    });
    return categoryList;

  }
  catch(e)
  {
    print("error :"+e.toString());
  }
}
Future<List<String>> gettingSpecialist(String alphabet) async {
  List<String> tests = <String>[];
  Set specialistSet = new Set();
  List<String> specialList = <String>[];
  try{
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Tests')
        .get();
    final List<DocumentSnapshot> documents = snapshot.docs;

    documents.forEach((element)
    {
      element.data().forEach((key, value) {
        if(key == "specialist"){
          if(value.toString().toUpperCase().startsWith(alphabet)){
            specialistSet.add(value.toString());
          }
        }
      });
      tests.add(element.id.toString());
    }
    );

    specialistSet.forEach((element) {
      specialList.add(element);
    });
    return specialList;

  }
  catch(e)
  {
    print("error :"+e.toString());
  }
}
Future<List<String>> gettingtestsBeta(String condition) async {

  try{
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Tests')
        .get();
    final List<DocumentSnapshot> documents = snapshot.docs;

    documents.forEach((element)
    {
      element.data().forEach((key, value) {
        if(value == condition){
          testByConditionList.add(element.id.toString());
        }
      });

    }
    );


    return testByConditionList;

  }
  catch(e)
  {
    print("error :"+e.toString());
  }
}
Future<List<String>> gettingtestsGamma(String specialist) async {

  try{
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Tests')
        .get();
    final List<DocumentSnapshot> documents = snapshot.docs;

    documents.forEach((element)
    {
      element.data().forEach((key, value) {
        if(value == specialist){
          testByConditionList.add(element.id.toString());
        }
      });

    }
    );


    return testByConditionList;

  }
  catch(e)
  {
    print("error :"+e.toString());
  }
}

Future<List<String>> gettingParameters(String alphabets) async {


  try{

    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Tests')
        .get();
    final List<DocumentSnapshot> documents = snapshot.docs;
    documents.forEach((element)
    {
      if(element.id== alphabets){
        element.data().forEach((key, value) {
          if(key.contains("para")){
            parameterList.add(value);
          }
        });
      }

    }
    );
    print(parameterList);
    return parameterList;

  }
  catch(e){
    print("error :"+e.toString());
  }
}


Future<void>signOut() async {
  FirebaseAuth user = FirebaseAuth.instance;
  await user.signOut();
}