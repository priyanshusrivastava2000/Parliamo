import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:parliamo/functions/signInGoogle.dart';
import 'package:parliamo/pages/login.dart';
import 'package:parliamo/pages/starter.dart';
import 'package:parliamo/pages/symptoms.dart';
String url;
var currentSubUser;
List<String>nameList = <String>[];
List<String>ageList = <String>[];
List<String>relationList = <String>[];
List<String>genderList = <String>[];
List<String>alphabets=<String>["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
List<String>testByConditionList = <String>[];
List<String>parameterList = <String>[];
List<String>rangeValues = <String>[];
List<String>subTestList = <String>[];
List<String>savedResultsKeys = <String>[];
List<String>savedResultsValues = <String>[];
List<String>displayDiagnosis = <String>["Coughing","Diarrhea","Fever","Headache","Muscle Pain","Vomiting"];
List<String>symptomList = <String>[];
List<radioButton>boolList = <radioButton>[];
List<String>selectedSymptomList=<String>[];
String diagnosisResult;
String photoUrl;
String name;
String email;
String createdOn;
var resultValues=new Map();
String result="";

class FAQ{
  FAQ({
   this.ques,
   this.ans,
   this.isExpanded,
   this.id
});
  String ques;
  String ans;
  bool isExpanded;
  String id;
}
List<FAQ>faqList=<FAQ>[];
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
          if(key.contains("range")){
            rangeValues.add(value);
          }
          if(key == "rangeAll"){
            for(int i=0;i<parameterList.length;i++){
              rangeValues.add(value);
            }
          }
        });
      }
    }
    );
    var length = parameterList.length;
    if(rangeValues.length != length){
      for(int i =0;i< length ; i++)
        {
          rangeValues.add(null);
        }
    }
    return parameterList;

  }
  catch(e){
    print("error :"+e.toString());
  }
}



Future<void>signOut(BuildContext context) async {
  FirebaseAuth user = FirebaseAuth.instance;
  await user.signOut();
  await googleSignIn.signOut();
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
      starterPage()), (Route<dynamic> route) => false);
}

Future<String> getUrl(String organ) async {
  final ref = FirebaseStorage.instance.ref().child(organ+'.png');
   url = await ref.getDownloadURL();
  return url;
}

Future<String> gettingSubTestsData() async {

  try{
    var user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(user.uid)
        .collection('SubUsers').doc(currentSubUser).collection('Tests').get();
    final List<DocumentSnapshot> documents = snapshot.docs;
    documents.forEach((element)
    {
      subTestList.add(element.id.toString());
    });

  }
  catch(e){
    print(e);
  }
}

Future<String> gettingSubTestsKeys(String test) async {

  try{
    var user = FirebaseAuth.instance.currentUser;
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(user.uid)
        .collection('SubUsers').doc(currentSubUser).collection('Tests').get();
    final List<DocumentSnapshot> documents = snapshot.docs;
    documents.forEach((element)
    {
      if(element.id == test)
        {
          element.data().forEach((key, value) {
            savedResultsKeys.add(key);
            savedResultsValues.add(value);
          });
        }
    });
    print(savedResultsValues);
    print(savedResultsKeys);
  }
  catch(e){
    print(e);
  }
}
Future<String> gettingResults(String parameter,String test,double val) async {

  try{
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Tests')
        .doc(test)
        .collection('Results')
        .get();
    final List<DocumentSnapshot> documents = snapshot.docs;
    if(documents.isEmpty)
      {
        result = null;
        return result;
      }

    else{
      documents.forEach((element)
      {
        element.data().forEach((key, value) {
          if(key == parameter){
            resultValues[element.id]=value;
          }
        });

      }
      );
      resultValues.forEach((key, value) {
        if(value != 'Positive/Negative'  )
        {
          if(val > double.parse(value.toString().replaceAll(" ", "").split('-')[0]) && val < double.parse(value.toString().replaceAll(" ", "").split('-')[1]))
          {

            result = key.toString();

            return result;
          }
        }
        else{

        }
      });
    }






  }
  catch(e)
  {
    print("error :"+e.toString());
  }
}
Future<List<String>> gettingDiagnose(String symptom) async {

  Set specialistSet = new Set();
  try{
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Diagnosis')
        .get();
    final List<DocumentSnapshot> documents = snapshot.docs;

    documents.forEach((element)
    {
      element.data().forEach((key, value) {
        if(value == symptom){
            element.data().values.forEach((value) {
              specialistSet.add(value);
            });
        }
      });

    }
    );

    specialistSet.forEach((element) {
      symptomList.add(element);
    });
    symptomList.sort();
   // symptomList.removeWhere((element)=> (displayDiagnosis).contains(element));
    symptomList.remove(symptom);
    symptomList.forEach((element) {
      boolList.add(radioButton(tag: element,value: false,count: 0));
    });
    return symptomList;

  }
  catch(e)
  {
    print("error :"+e.toString());
  }
}
Future<String> successiveSymptoms(String symptomSelect,List selected) async {
  List<String>disease=<String>[];

  int count=0;
  try{
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('Diagnosis')
        .get();
    final List<DocumentSnapshot> documents = snapshot.docs;

    documents.forEach((element)
    {
      if(element.data().containsValue(symptomSelect)&&element.data().containsValue(selected[0]))
        {

          disease.add(element.id);
          print(disease);
        }
    }
    );
    if(selected.length>1 && disease.length==1)
      {
        for(int i =1;i<selected.length;i++)
          {
              documents.forEach((element) {
                if(element.id == disease[0])
                  {
                    if(element.data().containsValue(selected[i]))
                    {
                      count = count +1;
                    }
                  }
              });

          }
        if(count == selected.length -1)
        {
          diagnosisResult = disease.first;
          return diagnosisResult;
        }
        else{
          diagnosisResult = "NOT FOUND";
          return diagnosisResult;
        }
      }
  else
    {
      for(int i=0;i<disease.length;i++)
        {
          for(int j = 1;j<selected.length;j++)
            {
              documents.forEach((element) {
                if(element.id == disease[i])
                  {
                    if(element.data().containsValue(selected[j]))
                      {
                        count = count +1;
                      }
                  }
              });
            }
          if(count == selected.length - 1)
          {
            diagnosisResult = disease[i];
            return diagnosisResult;
          }
          else{
            diagnosisResult = "NOT FOUND";
            return diagnosisResult;
          }
        }

    }


  }
  catch(e)
  {
    print("error :"+e.toString());
  }
}

Future<List<FAQ>> gettingFAQ() async {
  var values = [];
  try{
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('FAQ')
        .get();
    final List<DocumentSnapshot> documents = snapshot.docs;
    documents.forEach((element)
    {
      values = element.data().values.toList();
      values.sort();
      faqList.add(FAQ(ques: values.first,ans: values.last,isExpanded: false,id: element.id));
    });
   return faqList;
  }

  catch(e){
    print(e);
  }
}
Future<String>gettingUserImage() async {
  try
  {
    var user = FirebaseAuth.instance.currentUser;
    print(user.displayName);
    if(user.emailVerified)
      {
        photoUrl = user.photoURL;
        email = user.email;
        createdOn = user.metadata.creationTime.toString();
        name = user.displayName;
      }
    else{
      var snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .get()
          .then((value) {
        value.data().forEach((key, value) {});

        name = value.data()["name"];

      });
      final ref = FirebaseStorage.instance.ref().child('User.png');
      photoUrl = await ref.getDownloadURL();
      email=user.email;
      createdOn = user.metadata.creationTime.toString();
    }

  }
  catch(e)
  {

  }
}