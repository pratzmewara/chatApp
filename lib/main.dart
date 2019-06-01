import 'package:flutter/material.dart';
import 'package:chatapp/Screens/homepage.dart';
import 'package:chatapp/Screens/startpage.dart';
import 'package:chatapp/Screens/loginScreen.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = false;  
  runApp(new MyApp());
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          '/start':(BuildContext context)=>SplashScreen(),
          '/homepage': (BuildContext context) => MyHomePage(),
          '/intro':(BuildContext context)=>LoginScreen()
        }
    );
  }
}
