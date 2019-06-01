import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:chatapp/util.dart';
import 'package:chatapp/Data/chatData.dart';
import 'package:chatapp/Screens/ChatScreen.dart';

class ChatList extends StatefulWidget {
  ChatList();
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {

  _ChatListState();

 ChatData chatData;
 static const URL_GETCHATS="http://vithack.herokuapp.com/chats/user/to?email=angadsharma1016@gmail.com";
  Future fetchPosts(http.Client client) async {

    print("yjhtgfdsyutrgds");
    var response = await http.get(
      URL_GETCHATS, headers: {"Content-Type": "application/json"},);
    print("response");
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
chatData=ChatData.fromJson(jsonDecode(response.body));
      return chatData;
    }
    else {
      final data = json.decode(response.body);
      return data["err"];
    }
  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:fetchPosts(http.Client()),
        builder: (context, snapshot) {

     if(snapshot.data==null){
       return  SliverList(
         delegate: SliverChildListDelegate(
         [
         Container(
         child: Center(
         child: CircularProgressIndicator(),
       ),
          )
          ]
         ),
       ) ;
    }
     else {
      return SliverList(

           delegate: new SliverChildBuilderDelegate(

                 (BuildContext context, int index) {
               return
                 GestureDetector(child:
                 Container(
                   padding: EdgeInsets.only(top: 4),
                   width: MediaQuery
                       .of(context)
                       .size
                       .width,
                   height: 90,

                   child: ListTile(
                     title: Container(

                       width: MediaQuery
                           .of(context)
                           .size
                           .width,
                       height: 50,
                       child: Container(child: Row(
                           children: <Widget>[
                             Flexible(
                               child: Column(
                                 children: <Widget>[
                                   Row(
                                       mainAxisAlignment: MainAxisAlignment
                                           .spaceBetween,
                                       children: <Widget>[
                                         Container(
                                             padding: EdgeInsets.only(
                                                 top: 1, left: 8),
                                             alignment: Alignment(-1, 1),
                                             child: Text(
                                               chatData.docs[index].from,
                                               style: TextStyle(
                                                   color: Colors.black,
                                                   fontWeight: FontWeight.w700,
                                                   fontSize: 16),)),
                                         Container(
                                           padding: EdgeInsets.only(
                                               top: 3, left: 8),
                                           alignment: Alignment(-1, 0),
                                           child: Text(
                                             "4:04 pm",
                                             style: TextStyle(
                                                 color: Colors.black,
                                                 fontWeight: FontWeight.w300,
                                                 fontSize: 12),),
                                         ),
                                       ]
                                   ),
                                   Row(
                                       mainAxisAlignment: MainAxisAlignment
                                           .spaceBetween,
                                       children: <Widget>[
                                         Container(
                                           padding: EdgeInsets.only(
                                               top: 3, left: 8),
                                           alignment: Alignment(-1, 0),
                                           child: Text(
                                             chatData.docs[index].chat,
                                             style: TextStyle(
                                                 color: Colors.black,
                                                 fontWeight: FontWeight.w300,
                                                 fontSize: 12),),
                                         ),

                                         Container(

                                           padding: EdgeInsets.all(3),
                                           alignment: Alignment(-1, 0),
                                           decoration: BoxDecoration(
                                             shape: BoxShape.circle,
                                             color: Colors.grey[200],
                                           ),
                                           child: Center(child: Text(
                                             "",
                                             style: TextStyle(
                                                 color: Colors.white,
                                                 fontWeight: FontWeight.w300,
                                                 fontSize: 12),)),
                                         ),
                                       ]
                                   ),
                                   Container(
                                     margin: EdgeInsets.only(top: 8),
                                     height: 2,
                                     color: Colors.grey[300],
                                   )


                                 ],
                               )


                               , flex: 4,

                             )
                           ]),

                       ),
//                    Positioned(
//                        bottom: 35,left: 30,
//                        child:  Container(
//                          // padding: EdgeInsets.only(top: 1),
//                          alignment: Alignment.topCenter,
//                          child: Text("KFC", style: new TextStyle(fontSize: 12.0,fontFamily:'Raleway-Medium',color: white,fontWeight: FontWeight.w800),),
//                        )
//                    )


                     ),
                     //onTap:_restaurant
                   ),),
                 onTap: (){
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => ChatScreen(name: chatData.docs[index].from,)),
                   );
                 },
                 );
             },
             childCount: chatData.docs.length,
           ));
     }});
  }
}