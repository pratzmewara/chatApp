import 'dart:async';

import 'package:flutter/material.dart';
import 'package:chatapp/util.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chatapp/Data/userMangment.dart';

class SplashScreen extends StatefulWidget {


  SplashScreen({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}
class _SplashScreenState extends State<SplashScreen> {


  SharedPreferencesTest s= new SharedPreferencesTest();
  Future<bool> check;
  String set="false";
  _SplashScreenState({Key key });
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checktext();
    Future.delayed(const Duration(seconds:3),()
    {
      if (set.compareTo(true.toString()) == 0) {
        new Future.delayed(
            const Duration(seconds: 0),

                () => Navigator.of(context).pushReplacementNamed('/homepage')

        );
      }
      else
      if (set.compareTo(false.toString()) == 0 ) {
        print(set);
        new Future.delayed(
            const Duration(seconds: 0),

                () => Navigator.of(context).pushReplacementNamed('/intro')

        );
      }
      else{
        new Future.delayed(
            const Duration(seconds: 0),

                () => Navigator.of(context).pushReplacementNamed('/intro')

        );
      }
    });
  }

  String checktext() {
    check = s.getlogincheck();
    check.then((resultString) {
      setState(() {
        print("wsl;rgtyui");

        set = resultString.toString();
        print(set);
      });
    });
    if (set == null) {
      return 'sorry';
    }
    else {
      return set;
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color:primaryColor),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
//
                    ],
                  ),
                ),
              ),


            ],
          )
        ],
      ),
    );

  }
}