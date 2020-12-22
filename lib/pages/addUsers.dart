import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:parliamo/functions/database.dart';
import 'package:parliamo/functions/fetch.dart';
import 'package:parliamo/functions/transitionAnimation.dart';
import 'package:parliamo/homedemo.dart';
import 'package:parliamo/pages/aboutUS.dart';
import 'package:parliamo/pages/addUsersForm.dart';
import 'package:parliamo/pages/faq.dart';
import 'package:parliamo/pages/profilePage.dart';
import 'package:parliamo/pages/starter.dart';


class usersPage extends StatefulWidget {
  @override
  addUsers createState() => addUsers();
}
class addUsers extends State<usersPage> {

  var progress;
  var progress2;
  String userName = " ";
  var name,relation,bloodGroup,age,weight;
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettingUserImage();
    gettingData().then((String value){
      print("completed");
      setState(() {
        userName = value.split(" ").first;
        progress = true;
      });
    });
    gettingSubData().whenComplete((){
      gettinginfo().whenComplete((){
        setState(() {
          progress2 = true;
        });
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff0e779a),
          title: Text('TAKE CARE',style: TextStyle(color: Colors.white,fontSize: 25)),
          centerTitle: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Color(0xff0e779a),
          onPressed: (){
            showDialog(context: context,builder: (BuildContext context ){
              return   addForm();
            });
          },
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              Container(
                height: 250,
                width: 50,
                child: DrawerHeader(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('images/drawer.jpg'),
                        fit: BoxFit.fill,
                      )
                    ),

                ),
              ),
              ListTile(
                leading: Icon(Icons.account_circle_rounded,color: Colors.black,),
                title: new Text(
                  "My Profile",
                  style: TextStyle(
                    fontFamily: "Franklin Gothic",
                    fontSize: 20,
                    color:Color(0xff000000),
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){
                  setState(() {
                    gettingUserImage();
                  });
                  Navigator.of(context).push(ScaleRoute(page: profilePage()));
                },
              ),

              ListTile(
                leading: Icon(Icons.info,color: Colors.black,),
                title: new Text(
                  "About Us",
                  style: TextStyle(
                    fontFamily: "Franklin Gothic",
                    fontSize: 20,
                    color:Color(0xff000000),
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){
                  Navigator.of(context).push(ScaleRoute(page: aboutUs()));
                },
              ),
              ListTile(
                leading: Icon(Icons.contact_support_rounded,color: Colors.black,),
                title: new Text(
                  "FAQ",
                  style: TextStyle(
                    fontFamily: "Franklin Gothic",
                    fontSize: 20,
                    color:Color(0xff000000),
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){
                  Navigator.of(context).push(ScaleRoute(page: faq()));
                },
              ),
              ListTile(
                leading: Icon(Icons.power_settings_new,color: Colors.black,),
                title: new Text(
                  "LOGOUT",
                  style: TextStyle(
                    fontFamily: "Franklin Gothic",
                    fontSize: 20,
                    color:Color(0xff000000),
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: (){
                  nameList.clear();
                  relationList.clear();
                  ageList.clear();
                  genderList.clear();
                  signOut(context);
                },
              )
            ],
          ),
        ),
        backgroundColor: const Color(0xffeef9f9),
        body: (progress==true && progress2 == true)?Stack(
          children: <Widget>[

            (relationList.length==0 )?Transform.translate(
              offset: Offset(118.0, 300.0),
              child: Container(
                width: 190.0,
                height: 120.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('images/add.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                    child: Transform.translate(
                      offset: Offset(0.0, 120.0),
                      child: Text(
                        'Add some patients for care',
                        style: TextStyle(
                          fontFamily: 'Franklin Gothic',
                          fontSize: 15.5,
                          color: const Color(0xff1e1eb4),
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
              ),
            )
                :
            SingleChildScrollView(
              child: Column(
                children: [
                  Transform.translate(
                    offset: Offset(-70.0, 25.0),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: 'Franklin Gothic',
                          fontSize: 34,
                          color: const Color(0xff000000),
                        ),
                        children: [
                          TextSpan(
                            text: 'Hi, $userName \n',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: 'here at your care',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 20,
                              color: const Color(0xff567777),
                              fontWeight: FontWeight.w700,
                            ),
                          )

                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child:  Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 40,
                          ),
                          Text(
                            'PROFILES',
                            style: TextStyle(
                              fontFamily: 'Constantia',
                              fontSize: 24,
                              color: const Color(0xff08080a),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: relationList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index){
                          return GestureDetector(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [

                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 12.0,top: 5),
                                    child: Container(
                                      width: 340.0,
                                      height: 134.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(35.0),
                                        color: const Color(0xffffffff),
                                        border: Border.all(width: 3.0, color: const Color(0xff707070)),
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Container(
                                            width: 102.0,
                                            height: 103.0,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: (genderList[index]=="F")?AssetImage('images/userFemale.png'):AssetImage('images/userMale.png'),
                                                fit: BoxFit.fill,
                                              ),
                                            ),

                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Container(
                                                width: 179.0,
                                                height: 27.0,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xffffffff),
                                                  border: Border.all(
                                                      width: 3.0, color: const Color(0xff707070)),
                                                ),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Text(
                                                      'NAME: ',
                                                      style: TextStyle(
                                                        fontFamily: 'Constantia',
                                                        fontSize: 13,
                                                        color: const Color(0xff08080a),
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                    Text(
                                                      '${nameList[index].split(" ").first}',
                                                      style: TextStyle(
                                                        fontFamily: 'Constantia',
                                                        fontSize: 15,
                                                        color: const Color(0xff08080a),

                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 179.0,
                                                height: 27.0,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xffffffff),
                                                  border: Border.all(
                                                      width: 3.0, color: const Color(0xff707070)),
                                                ),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Text(
                                                      'AGE: ',
                                                      style: TextStyle(
                                                        fontFamily: 'Constantia',
                                                        fontSize: 13,
                                                        color: const Color(0xff08080a),
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                    Text(
                                                      '${ageList[index]}',
                                                      style: TextStyle(
                                                        fontFamily: 'Constantia',
                                                        fontSize: 15,
                                                        color: const Color(0xff08080a),

                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 179.0,
                                                height: 27.0,
                                                decoration: BoxDecoration(
                                                  color: const Color(0xffffffff),
                                                  border: Border.all(
                                                      width: 4.0, color: const Color(0xff707070)),
                                                ),
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Text(
                                                      'RELATION: ',
                                                      style: TextStyle(
                                                        fontFamily: 'Constantia',
                                                        fontSize: 13,
                                                        color: const Color(0xff08080a),
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                    Text(
                                                      '${relationList[index]}',
                                                      style: TextStyle(
                                                        fontFamily: 'Constantia',
                                                        fontSize: 15,
                                                        color: const Color(0xff08080a),

                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            onTap: (){
                              setState(() {
                                displayName = nameList[index];
                                currentSubUser = relationList[index];
                              });
                              Navigator.of(context).push(ScaleRoute(page: home()));
                            },
                          );
                        }
                        ),
                  ),
                ],
              ),
            ),




          ],
        ):Center(child: CircularProgressIndicator())
      )
    );
  }
}
