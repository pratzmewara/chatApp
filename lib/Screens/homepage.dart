import 'package:flutter/material.dart';
import 'package:chatapp/util.dart';
import 'package:chatapp/Data/userMangment.dart';
import 'package:chatapp/Screens/chatlist.dart';
import 'package:flutter/rendering.dart';

import 'dart:math' as math;




class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,}) : super(key: key);




  @override
  State<MyHomePage>  createState() => _HomePageState();
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent)
  {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
@override
bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {

  return null;
}


SliverPersistentHeader makeHeader(String headerText,bool _isVisible) {
  return SliverPersistentHeader(
    pinned: true,
    delegate: _SliverAppBarDelegate(
      minHeight: 10.0,
      maxHeight: 120.0,
      child: Container(
        decoration:BoxDecoration(
    shape: BoxShape.rectangle,
            color: Colors.lightBlue,
    borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft:Radius.circular(20) )),
           child:
         // Visibility(
//              visible:_isVisible,
           Container(
             margin: EdgeInsets.only(left: 16),
             child:Column(
               children: <Widget>[
                 Text("Conversation",style: TextStyle(color: Colors.white,fontSize: 10),) ,

                 Container(
                   margin: EdgeInsets.all(16),

                     decoration:BoxDecoration(
                         shape: BoxShape.rectangle,
                         color: Colors.white,
                         borderRadius: BorderRadius.all( Radius.circular(5))),


                   child: TextField(
                     cursorColor: primaryColor,
                     // controller: locationController,
                     decoration:  InputDecoration(

//                       border: new OutlineInputBorder(
//                         borderRadius: const BorderRadius.all(
//                           const Radius.circular(10.0),
//                         )),
                       icon: Container(padding: EdgeInsets.only(left: 6), child: Icon(Icons.search, color: Colors.black,),),
                       hintText: "Search",
                       border: InputBorder.none,
                      // contentPadding: EdgeInsets.only(left: 15.0, top: 16.0),
                     ),
                   ),
                 ),
               ],
             )

           )), ),

  );
}

SliverPersistentHeader normalHeader(String headerText) {
  return SliverPersistentHeader(
    pinned: true,
    delegate: _SliverAppBarDelegate(
      minHeight: 44.0,
      maxHeight: 44.0,
    child:  Container(

        child:Column(
        children: <Widget>[
        Container(
            color: Colors.white,
            child:  Container(
            height: 20,
            decoration:BoxDecoration(
                shape: BoxShape.rectangle,
                color: primaryColor,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft:Radius.circular(20) )),
      )),
          Container(
            decoration:BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),bottomLeft:Radius.circular(20) )),
            child:
            Container(
                margin: EdgeInsets.only(left: 16),
                child:Row(
                  children: <Widget>[
                    Text(headerText,style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w500),) ,
                    Icon(Icons.keyboard_arrow_down)

                  ],
                )

            ), ),
        ],
      ))
    ),
  );
}


class _HomePageState extends State<MyHomePage> {

  Color homecolor=primaryColor;
  Color expcolor=Colors.black;
  Color ordercolor=Colors.black;
  Color vaultcolor=Colors.black;
  Color profcolor=Colors.black;
  Color ordertext=Colors.black;

  bool pressAttentionOffer=true;
  bool pressAttentionLP=false;
  bool pressAttentionOfferBorder=true;
  bool pressAttentionLPBorder=false;

  Color offerColor=Colors.white;
  Color loyalityColor=primaryColor;


  String offericon="icons/localoffer";
  IconData profileicon=Icons.person_outline;
 // IconData filledoffer=MyFlutterApp.tag;

  double homesize=35.0;
  double expsize=25.0;
  double vaultsize=25.0;double profsize=25.0;
 // Color fabcolor=lightgrey;






  TextEditingController controller = TextEditingController();





  SharedPreferencesTest s=new SharedPreferencesTest();



  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ?? false;
  }

  ScrollController _scrollController = new ScrollController();

  bool _isVisible;

  @override
  initState(){
    super.initState();
    s.setlogincheck(true);
    _isVisible = false;
    _scrollController = new ScrollController();
    _scrollController.addListener((){
      if(_scrollController.position.userScrollDirection == ScrollDirection.reverse){
        setState((){
          _isVisible = false;
        });
      }
      if(_scrollController.position.userScrollDirection == ScrollDirection.forward){
        setState((){
          _isVisible = true;
        });
      }
     // if(_scrollController.position.userScrollDirection==S)
    });
  }

  SliverPersistentHeader selectHeader() {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
          minHeight: 50.0,
          maxHeight: 50.0,

          child:  Container(
//              padding: EdgeInsets.all(5),
              child:Column(
                children: <Widget>[
                  Container(
                    //   color: Colors.white,
                      child:  Container(
                        height: 45,

                        color:Colors.grey[200],

                        child:
                        Container(
                            width: MediaQuery.of(context).size.width,
                            child : Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  width: MediaQuery.of(context).size.width,
                                  //padding: EdgeInsets.symmetric(vertical: 5.0),
                                  decoration: new BoxDecoration(color: Colors.grey[200]),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: (){
                                          OfferAction();
                                        },
                                        child :Container(
                                          width: MediaQuery.of(context).size.width/2-50,
                                          padding: EdgeInsets.only(top: 3,bottom: 3,left: 5,right: 5),
                                          decoration: new BoxDecoration(
                                              border: Border.all(width: 1.0,color: pressAttentionOfferBorder ?primaryColor:primaryColor,),
                                              borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                                              color: pressAttentionOffer ? primaryColor:Colors.grey[200]),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                  padding:EdgeInsets.all(3),
                                                  child: Text('From',style: TextStyle(color: offerColor),)
                                              )
                                            ],
                                          ),
                                        ),),
                                      GestureDetector(
                                          onTap: (){
                                            LPAction();
                                          },
                                          child : Container(
                                            width: MediaQuery.of(context).size.width/2-50,
                                            padding: EdgeInsets.only(top: 3,bottom: 3,left: 5,right: 5),
                                            decoration: new BoxDecoration(
                                                border: Border.all(width: 1.0,color: pressAttentionLPBorder ? primaryColor:primaryColor,),
                                                borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                                                color: pressAttentionLP ? primaryColor:Colors.grey[200]),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Container(
                                                    padding:EdgeInsets.all(3),
                                                    child: Text('To',style: TextStyle(color:loyalityColor),)
                                                )
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                )
                              ],
                            )),

                      )

                  ),

                ],
              ))
      ),
    );
  }

  void OfferAction(){
    setState(() {
      pressAttentionOffer=true;
      pressAttentionOfferBorder=true;
      pressAttentionLP=false;
      pressAttentionLPBorder=false;
      offerColor=Colors.white;
      loyalityColor=primaryColor;

    });
  }

  void LPAction(){
    setState(() {
      pressAttentionOfferBorder=false;
      pressAttentionLP=true;
      pressAttentionLPBorder=true;
      pressAttentionOffer=false;
      offerColor=primaryColor;
      loyalityColor=Colors.white;

    });
  }





  @override
  Widget build(BuildContext context) {

    return WillPopScope(
        onWillPop: _onWillPop,
        child:Scaffold(

          appBar: AppBar(
            backgroundColor: primaryColor,
            title:Text("VITHack",style: TextStyle(color: Colors.white),),
            automaticallyImplyLeading: false,
            elevation: 0,
            actions: <Widget>[
              IconButton(icon: Icon(Icons.contacts,color: Colors.white,),)
            ],
          ),
          backgroundColor: backgroundColor,
          body:Container(
            color: Colors.grey[200],
              child:CustomScrollView(
            controller:_scrollController ,
              slivers: <Widget>[

              normalHeader("Chats"),
//              selectHeader(),
              ChatList(),

              ])),

    )
    );






}
}

