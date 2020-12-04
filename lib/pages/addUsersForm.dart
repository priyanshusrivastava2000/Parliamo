import 'package:flutter/material.dart';
import 'package:parliamo/functions/database.dart';
import 'package:parliamo/functions/fetch.dart';
import 'package:parliamo/pages/addUsers.dart';
final addusersformKey = GlobalKey<FormState>();
class addForm extends StatefulWidget {
  @override
  usersForm createState() => usersForm();
}
class usersForm extends State<addForm> {
  var name,age,blood,weight,relation,gender;
  bool progress = true;
  List<String> bloodGroups = ["O+","A+","B+","AB+","O-","A-","B-","AB-"];
  List<String> sex = ["M","F","Other"];
  String selectedGroup;
  String selectedGender;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: addusersformKey,
      child: Dialog(
          child: Stack(
            children: <Widget>[
              Transform.translate(
                offset: Offset(-10.0, 0.0),
                child:
                    // Adobe XD layer: 'images (1)' (shape)
                    Container(
                  width: 515.5,
                  height: 551.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('images/form.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(35.0, 40.0),
                child: Container(
                  width: 260.0,
                  height: 480.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(26.0),
                    color: const Color(0xe5ffffff),
                    border: Border.all(width: 1.0, color: const Color(0xe5707070)),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(80.0, 60.0),
                child: SizedBox(
                  width: 157.0,
                  height: 39.0,
                  child: SingleChildScrollView(
                      child: Text(
                    'USER INFO',
                    style: TextStyle(
                      fontFamily: 'Segoe UI',
                      fontSize: 30,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
              Transform.translate(
                offset: Offset(110.0, 413.0),
                child: Container(
                  width: 109.0,
                  height: 36.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                    color: const Color(0xffb7d9e2),
                  ),
                  child: FlatButton(
                    onPressed: () async {
                      if(addusersformKey.currentState.validate()){
                        setState(() {
                          progress = false;
                        });
                      }
                      addusersformKey.currentState.save();
                      try{
                        await SubUsersData(uid: user.uid).subUserData(name, age, blood, weight, relation,gender).whenComplete((){
                          relationList.clear();
                          nameList.clear();
                          ageList.clear();
                          genderList.clear();
                          Navigator.pop(context);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => usersPage()));
                        });
                      }
                      catch(e){
                        setState(() {
                          progress = true;
                        });
                      }
                    },
                    child:  (progress)?SizedBox(
                      width: 110.0,
                      child: Text(
                        'ADD',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 25,
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ):Center(child: CircularProgressIndicator(),)
                  ),
                ),
              ),

              Transform.translate(
                offset: Offset(72.0, 142.0),
                child: Container(
                  width: 200.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: const Color(0xfff0ffd6),
                    border: Border.all(width: 1.0, color: const Color(0xff707070)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 20,),
                      Expanded(

                        child: TextFormField(
                        maxLines: 1,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                                    ),
                            onChanged: (value){
                              name = value;
                              },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(72.0, 196.0),
                child: Container(
                  width: 200.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: const Color(0xfff0ffd6),
                    border: Border.all(width: 1.0, color: const Color(0xff707070)),
                  ),
                  child:  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,

                        ),
                        onChanged: (value){
                          age = value;
                        },
                      ),
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(72.0, 252.0),
                child: Container(
                  width: 100.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: const Color(0xfff0ffd6),
                    border: Border.all(width: 1.0, color: const Color(0xff707070)),
                  ),
                  child:  Row(
                    children: [
                      SizedBox(width: 35,),
                      Flexible(
                          child: DropdownButton(
                        value: selectedGroup,
                        onChanged: (value){
                          setState(() {
                            selectedGroup = value;
                            blood = value;
                          });
                        },
                        items: bloodGroups.map((e){
                          return DropdownMenuItem(
                              child: new Text(e,style: TextStyle(fontSize: 20),),
                            value: e,
                          );
                        }).toList(),
                      )
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(180.0, 252.0),
                child: Container(
                  width: 95.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: const Color(0xfff0ffd6),
                    border: Border.all(width: 1.0, color: const Color(0xff707070)),
                  ),
                  child:  Row(
                    children: [
                      SizedBox(width: 35,),
                      Flexible(
                          child: DropdownButton(
                            value: selectedGender,
                            onChanged: (value){
                              setState(() {
                                selectedGender = value;
                                gender = value;
                              });
                            },
                            items: sex.map((e){
                              return DropdownMenuItem(
                                child: new Text(e,style: TextStyle(fontSize: 13),),
                                value: e,
                              );
                            }).toList(),
                          )
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(72.0, 308.0),
                child: Container(
                  width: 200.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: const Color(0xfff0ffd6),
                    border: Border.all(width: 1.0, color: const Color(0xff707070)),
                  ),
                  child:  Row(
                    children: [
                      SizedBox(width: 20,),
                      Flexible(child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,

                        ),
                        onChanged: (value){
                          weight = value;
                        },
                      ),
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(72.0, 362.0),
                child: Container(
                  width: 200.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: const Color(0xfff0ffd6),
                    border: Border.all(width: 1.0, color: const Color(0xff707070)),
                  ),
                  child:  Row(
                    children: [
                      SizedBox(width: 20,),
                      Flexible(child: TextFormField(
                        maxLines: 1,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                        ),
                        onChanged: (value){
                          relation = value;
                        },
                      ),
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(72.0, 252.0),
                child:
                    // Adobe XD layer: 'blood' (shape)
                    Container(
                  width: 19.0,
                  height: 28.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('images/blood.png'),
                      fit: BoxFit.fill,
                    ),
                  ),

                ),
              ),
              Transform.translate(
                offset: Offset(182.0, 252.0),
                child:
                // Adobe XD layer: 'blood' (shape)
                Container(
                  width: 24.0,
                  height: 28.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('images/gender.png'),
                      fit: BoxFit.fill,
                    ),
                  ),

                ),
              ),
              Transform.translate(
                offset: Offset(71.0, 365.0),
                child:
                    // Adobe XD layer: 'relation' (shape)
                    Container(
                  width: 21.0,
                  height: 23.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('images/relation.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(71.0, 146.0),
                child:
                    // Adobe XD layer: 'name' (shape)
                    Container(
                  width: 21.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('images/name.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(72.0, 313.0),
                child:
                    // Adobe XD layer: 'weight' (shape)
                    Container(
                  width: 19.0,
                  height: 19.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('images/weight.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(71.0, 200.0),
                child:
                    // Adobe XD layer: 'cal' (shape)
                    Container(
                  width: 22.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('images/age.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(72.0, 127.0),
                child: Text(
                  'NAME',
                  style: TextStyle(
                    fontFamily: 'Franklin Gothic',
                    fontSize: 15,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Transform.translate(
                offset: Offset(72.0, 181.0),
                child: Text(
                  'AGE',
                  style: TextStyle(
                    fontFamily: 'Franklin Gothic',
                    fontSize: 15,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Transform.translate(
                offset: Offset(72.0, 238.0),
                child: Text(
                  'BLOOD GROUP',
                  style: TextStyle(
                    fontFamily: 'Franklin Gothic',
                    fontSize: 13,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Transform.translate(
                offset: Offset(180.0, 238.0),
                child: Text(
                  'GENDER',
                  style: TextStyle(
                    fontFamily: 'Franklin Gothic',
                    fontSize: 13,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Transform.translate(
                offset: Offset(72.0, 293.0),
                child: Text(
                  'WEIGHT',
                  style: TextStyle(
                    fontFamily: 'Franklin Gothic',
                    fontSize: 15,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Transform.translate(
                offset: Offset(72.0, 349.0),
                child: Text(
                  'RELATION',
                  style: TextStyle(
                    fontFamily: 'Franklin Gothic',
                    fontSize: 15,
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
    );
  }
}
