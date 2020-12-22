import 'package:flutter/material.dart';
import 'package:parliamo/functions/fetch.dart';
class faq extends StatefulWidget {
  @override
  _faqState createState() => _faqState();
}
class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    Key key,
    @required this.child,
    this.height,
    this.width,
    this.color = Colors.white,
    this.padding = const EdgeInsets.all(16.0),
    this.margin,
    this.borderRadius,
    this.alignment,
    this.elevation,
  }) : super(key: key);
  final Widget child;
  final double width;
  final double height;
  final Color color;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final BorderRadius borderRadius;
  final AlignmentGeometry alignment;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin ?? const EdgeInsets.all(0),
      color: color,
      elevation: elevation ?? 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(20.0),
      ),
      child: Container(
        alignment: alignment,
        height: height,
        width: width,
        padding: padding,
        child: child,
      ),
    );
  }
}
class _faqState extends State<faq> {
  bool progress = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettingFAQ().whenComplete((){
      setState(() {
        progress = true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        faqList.clear();
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: const Color(0xffeef9f9),
        appBar: AppBar(
          backgroundColor: Color(0xff0e779a),
          title: Text('TAKE CARE',style: TextStyle(color: Colors.white,fontSize: 25)),
          centerTitle: true,
          leading: BackButton(
            onPressed: (){
              setState(() {
                faqList.clear();
              });
              Navigator.pop(context);
            },
          ),
        ),
        body: (progress)?SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      'FAQ',
                      style: TextStyle(
                        fontFamily: 'Constantia',
                        fontSize: 35,
                        color: const Color(0xff08080a),
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child: Text(
                      'Frequently Asked Questions',
                      style: TextStyle(
                        fontFamily: 'Constantia',
                        fontSize: 20,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),

                    ),
                  ),
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemCount: faqList.length,
                  itemBuilder: (BuildContext context,int index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RoundedContainer(
                        borderRadius: BorderRadius.circular(40),
                        child: ExpansionPanelList(
                          animationDuration: Duration(microseconds: 500),
                          elevation: 0,
                          children: [
                            ExpansionPanel(

                              body: Container(
                                padding: EdgeInsets.all(7),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(

                                        child: Text(
                                          '${faqList[index].ans}',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        width: 330,
                                      ),
                                    ),


                                  ],
                                ),
                              ),
                              headerBuilder: (BuildContext context, bool isExpanded) {
                                return Container(

                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      '${faqList[index].id + ":" + " "} ${faqList[index].ques}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),

                                );
                              },
                              isExpanded: faqList[index].isExpanded,
                            ),
                          ],
                          expansionCallback: (int item, bool status) {
                            setState(() {
                              faqList[index].isExpanded = !faqList[index].isExpanded;
                            });
                          },
                        ),
                      ),
                    );
                  } )
            ],
          ),
        ):Center(child: CircularProgressIndicator(),)
      ),
    );
  }
}
