import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:parliamo/functions/fetch.dart';
import 'package:parliamo/functions/pdfViewer.dart';
import 'package:parliamo/functions/resultsPDF.dart';

String organ;
class content{
  content({
   this.headerValue,
   this.height,
   this.width,
   this.i,
   this.container,
   this.type,
   this.icon
});
  String headerValue;
  double height = 50;
  double width=350;
  int i;
  Widget container;
  int type;
  Icon icon ;
}
List<content> headings;
getList(){
  if(organ=="CBC")
    {
       headings = <content>[
        content(headerValue: 'OVERVIEW',container: Container(
          child:  Text('OVERVIEW',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
        ),type: 1,i: 0,icon:  Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 30,)),
        content(headerValue: 'SIDE EFFECTS',container: Container(
          child:  Text('SIDE EFFECTS',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
        ),type: 2,i: 0,icon:  Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 30,)),
        content(headerValue: 'MEASUREMENT',container: Container(
          child:  Text('MEASUREMENT',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
        ),type: 3,i: 0,icon:  Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 30,)),
        content(headerValue: 'RESULTS',container: Container(
          child:  Text('RESULTS',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
        ),type: 4,i: 0,icon:  Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 30,)),
      ];
       return headings;
    }
  if(organ == "Allergy")
    {
      headings = <content>[
        content(headerValue: 'OVERVIEW',container: Container(
          child:  Text('OVERVIEW',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
        ),type: 1,i: 0,icon:  Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 30,)),
        content(headerValue: 'SYMPTOMS',container: Container(
          child:  Text('SYMPTOMS',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
        ),type: 2,i: 0,icon:  Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 30,)),
        content(headerValue: 'TESTING SIGNIFICANCE',container: Container(
          child:  Text('TESTING SIGNIFICANCE',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
        ),type: 3,i: 0,icon:  Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 30,)),
        content(headerValue: 'TYPES',container: Container(
          child:  Text('TYPES',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
        ),type: 4,i: 0,icon:  Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 30,)),
        content(headerValue: 'TESTS',container: Container(
          child:  Text('TESTS',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
        ),type: 5,i: 0,icon: Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 30,))
      ];
      return headings;
    }
  else{
     headings = <content>[
      content(headerValue: 'OVERVIEW',container: Container(
        child:  Text('OVERVIEW',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
      ),type: 1,i: 0,icon:  Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 30,)),
      content(headerValue: 'SYMPTOMS',container: Container(
        child:  Text('SYMPTOMS',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
      ),type: 2,i: 0,icon:  Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 30,)),
      content(headerValue: 'CAUSES',container: Container(
        child:  Text('CAUSES',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
      ),type: 3,i: 0,icon:  Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 30,)),
      content(headerValue: 'TYPES',container: Container(
        child:  Text('TYPES',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
      ),type: 4,i: 0,icon:  Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 30,)),
      content(headerValue: 'TESTS',container: Container(
        child:  Text('TESTS',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
      ),type: 5,i: 0,icon: Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 30,))
    ];
     return headings;
  }

}

class lifeCycleDIsorder extends StatefulWidget {
  @override
  _lifeCycleDIsorderState createState() => _lifeCycleDIsorderState();
}

class _lifeCycleDIsorderState extends State<lifeCycleDIsorder> {
  bool progress;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getList();
    getUrl(organ).whenComplete((){
      setState(() {
        progress = true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffeef9f9),
      appBar: AppBar(
        backgroundColor: Color(0xff0e779a),
        title: Text('TAKE CARE',style: TextStyle(color: Colors.white,fontSize: 25)),
        centerTitle: true,
      ),
      body: (progress == true)?SingleChildScrollView(

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      organ.toUpperCase(),
                      style: TextStyle(
                        fontFamily: 'Constantia',
                        fontSize: 55,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 200.00,
                        width: 200.00,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/lifecycle.png'),
                              fit: BoxFit.fill
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 40,
                      top: 20,
                      child: Container(
                        height: 100.00,
                        width: 100.00,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(url),
                              fit: BoxFit.fill
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                itemCount: headings.length,
                itemBuilder: (BuildContext context,int index){
              return  Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedContainer(
                  width: headings[index].width,
                  height: headings[index].height,
                  decoration: BoxDecoration(

                      border: Border.all(color: Color(0xff0e779a),width: 3 )
                  ),
                  duration: Duration(milliseconds: 500),
                  child:   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: headings[index].container,
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: IconButton(icon: headings[index].icon,
                              onPressed: (){
                                setState(() {
                                  print(headings[index].i);
                                  if(headings[index].i.isEven||headings[index].i==0)
                                  {
                                    headings[index].height = 350.00;
                                    headings[index].icon = Icon(Icons.keyboard_arrow_up,color: Colors.black,size: 30,);
                                    headings[index].container = SingleChildScrollView(

                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Container(
                                              child:  Text(headings[index].headerValue,style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
                                            ),
                                          ),

                                         PDFViewer(organ:organ,type: headings[index].type,),

                                        ],
                                      ),
                                    );

                                    headings[index].i=headings[index].i+1;
                                  }
                                  else{
                                    headings[index].height = 51.00;
                                    headings[index].icon = Icon(Icons.keyboard_arrow_down,color: Colors.black,size: 30,);
                                    headings[index].container = Column(
                                      children: [
                                        Container(
                                          child:  Text(headings[index].headerValue,style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
                                        ),

                                      ],
                                    );
                                    headings[index].i=headings[index].i+1;
                                  }
                                });
                              })
                      ),
                    ],
                  ),
                ),
              );
            }),
            SizedBox(height: 60,)
          ],
        ),
      ):Center(child: CircularProgressIndicator(),)
    );
  }
}
