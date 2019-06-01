import 'package:flutter/material.dart';
import 'package:chatapp/util.dart';

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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(name),),
      body: Container(

      ),
      bottomNavigationBar:BottomAppBar(
        child: Row(
          children: <Widget>[

            Container(
              margin: EdgeInsets.only(top: 50,right: 16,left: 16,bottom: 16),

              height: 50.0,
              width: double.infinity,
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
      ) ,
    );
  }

}
