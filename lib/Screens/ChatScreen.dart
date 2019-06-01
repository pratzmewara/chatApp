import 'package:flutter/material.dart';
import 'package:chatapp/util.dart';
import 'package:chatapp/Data/chatToAndFrom.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ChatScreen extends StatefulWidget{
  final name;
  ChatScreen({this.name});

  @override
  State<StatefulWidget> createState() {
    return ChatScreenState(name: name);
  }

}

class ChatScreenState extends State<ChatScreen>{
  final name;

  ChatScreenState({this.name});

  

 ChatToAndFromList chatData;
 static const URL_GETCHATS="http://vithack.herokuapp.com/chats/user/from-and-to?from=angadsharma1016@gmail.com&to=angadsharma1016@gmail.com";
  Future fetchPosts(http.Client client) async {

    print("yjhtgfdsyutrgds");
    var response = await http.get(
      URL_GETCHATS, headers: {"Content-Type": "application/json"},);
    print("response");
    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
chatData=ChatToAndFromList.fromJson(jsonDecode(response.body));
      return chatData;
    }
    else {
      final data = json.decode(response.body);
      return data["err"];
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(title: new Text(widget.name),),
      body: FutureBuilder(
        future: fetchPosts(http.Client()),
        builder: (context, snapshot) {

     if(snapshot.data==null){
       return Container(
    child: Center(
    child: CircularProgressIndicator(),
    ),
    );
       /* SliverList(
         delegate: SliverChildListDelegate(
         [
         Container(
         child: Center(
         child: CircularProgressIndicator(),
       ),
          )
          ]
         ),
        ) */
    }
     else {
      return 
      /*SliverList(

           delegate: new SliverChildBuilderDelegate(

                 (BuildContext context, int index) {
               return
                 GestureDetector
                 (child:*/
     
      new Column(
        children: <Widget>[
          new Expanded(
            child: new ListView.builder
              (
                itemCount: chatData.photos.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return 
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
                                               chatData.photos[index].from,
                                               style: TextStyle(
                                                   color: Colors.black,
                                                   fontWeight: FontWeight.w700,
                                                   fontSize: 14),)),
                                         Container(
                                           padding: EdgeInsets.only(
                                               top: 3, left: 8),
                                           alignment: Alignment(-1, 0),
                                           child: Text(
                                             "8:00 pm",
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
                                             chatData.photos[index].chat,
                                             style: TextStyle(
                                                 color: Colors.black,
                                                 fontWeight: FontWeight.w300,
                                                 fontSize: 12),),
                                         ),

                                        /* Container(

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
                                         ),*/
                                       ]
                                   ),
                                   Container(
                                     margin: EdgeInsets.only(top: 8),
                                     height: 2,
                                     color: Colors.grey[300],
                                   )
                                 ],
                               ), 
                               flex: 4,
                             )
                           ]),
                       ),
                     ),
                   ),
                  );
                }
              ),
        )
        ],
    );
             }
             //childCount: chatData.photos.length,
         } )
    );}}
      /*bottomNavigationBar:BottomAppBar(
        child: Row(
          children: <Widget>[

            Container(
              margin: EdgeInsets.only(top: 50,right: 16,left: 16,bottom: 16),

              height: 50.0,
             // width: double.infinity,
//              decoration: continerDecor,

              child: TextField(
                cursorColor:primaryColor ,
// controller: locationController,
                decoration:  InputDecoration(
                  icon: Container(margin: EdgeInsets.only(left: 20, top: 5), width: 10, height: 10, child: Icon(Icons.search, color: Colors.black,),),
                  hintText: "Search",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15.0, top: 16.0),
                ),
              ),
            ),
          ],

        ),
      ) ,*/
