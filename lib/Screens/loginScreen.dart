import 'package:flutter/material.dart';
import 'dart:async';
import 'package:chatapp/Screens/homepage.dart';
import 'dart:convert';
import 'package:chatapp/util.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextStyle style = TextStyle(fontSize: 20.0, color: primaryColor,);

  bool _validate = false;
  String logemail;
  String _logpass;
  bool obsc=true;

  String meth;
  Icon ic=Icon(Icons.lock_outline,color: Colors.grey,);
  void toHomePage() {
    // Process your data and upload to server
    _key.currentState?.reset();
    _load=false;
    Navigator.push(context,MaterialPageRoute(builder: (context)=>MyHomePage()));
  }
//  void toSignupPage() {
//
//    Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUpScreen()));
//
//  }
//
////  pass(){
//    if(obsc){
//      setState(() {
//        ic=Icon(Icons.lock_open,color: Colors.pink,);
//        obsc=false;
//      });
//    }
//    else if(!obsc){
//      setState(() {
//        ic=Icon(Icons.lock_outline,color: Colors.grey,);
//        obsc=true;
//      });
//    }
//  }

  GlobalKey<FormState> _key = new GlobalKey();


  Map<String, dynamic> body =
  {
    "method":"email",
    "methodValue":"pratz@gmail.com",
    "password":"qwerty"
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(body: new Form(
      key: _key,
      autovalidate: _validate,
      child: FormUI(),
    ), );
  }
  bool _load = false;
  Widget FormUI() {

    Widget loadingIndicator =_load? new Container(
      height: 200,
      width: 250,
      decoration: new BoxDecoration(
          color: Colors.grey,

          borderRadius: new BorderRadius.all(Radius.circular(10.0))),

      child: new Padding(padding: const EdgeInsets.all(16.0),child: new Center(child:Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              new CircularProgressIndicator(),
              Text("Logging in...")
            ],
          )
      ) )),
    ):new Container();

    int flag;
    return  Stack(children: <Widget>[SingleChildScrollView(child:

    Container(

        height: MediaQuery.of(context).size.height,

        color: Colors.white,


        child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround ,
            children: <Widget>[

              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 80.0),
                      color:primaryColor,
                      width: 100,
                      height: 100,
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 16.0,right:16.0,top: 26.0),
                        child:
                        TextFormField(
                            style: TextStyle(color: Colors.black),
                            cursorColor:  Theme.of(context).primaryColor,

                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'eg@gmail.com',
                                labelText: 'Email or Phone Number'
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: validateEM,
                            onSaved: (String val) {
                              logemail = val;
                              print(logemail);
                            }

                        )
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 16.0,right:16.0,top: 16.0),
                        child:
                        TextFormField(
                          style: TextStyle(color: Colors.black),
                          cursorColor:  Theme.of(context).accentColor,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),

                              labelText: 'Password'
                          ),
                          validator: (val) => val.length == 0 ? 'Please Enter the Password' : (val.length<6)?'Password too short':null,
                          onSaved: (val) => _logpass = val,
                          obscureText: true,

                        )
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width-100,
                        margin: EdgeInsets.only(top: 16),
                        alignment: Alignment.center,
                        child:
                        new Row(
                            children: <Widget>[
                              new Expanded(
                                  child: new FlatButton(

                                    shape: new RoundedRectangleBorder(

                                        borderRadius: new BorderRadius.circular(3.0)),
                                    color: primaryColor,
                                  //  splashColor: Colors.blue,

                                    onPressed: () {
                                      setState((){

                                        _login_Server();

                                      });
                                    },

                                    child: new Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 20.0,
                                        horizontal: 20.0,
                                      ),
                                      child: new Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          new Expanded(
                                            child: Text(
                                              "LOGIN",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.white ,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),))])),


                  ],
                ),
              )]))),
      new Align(child: loadingIndicator,alignment: FractionalOffset.center,),
    ]);
  }
  String validateEM(String value) {
    print (value);
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    String pattern1 = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp1 = new RegExp(pattern1);
    if(regExp.hasMatch(value) && (value.isNotEmpty)){
      meth="phoneNo";

      if (value.length == 0) {
        return "Mobile is Required";
      } else if(value.length != 10){
        return "Mobile number must 10 digits";
      }else if (!regExp.hasMatch(value)) {
        return "Mobile Number must be digits";
      }
      return null;
    }
    else if(regExp1.hasMatch(value)&& value.isNotEmpty){
      meth="email";
      if (value.length == 0) {
        return "Email is Required";
      } else if(!regExp1.hasMatch(value)){
        return "Invalid Email";
      }else {
        return null;
      }
    }
    else {
      return "Enter the Details";
    }
  }

  _login_Server() {
    if(_key.currentState.validate())
    {
      _key.currentState.save();
      _load=true;
//      body["method"] = '$meth';
//      body["methodValue"] = '$logemail';
//      body["password"] = '$_logpass';

//      Future fetchPosts(http.Client client) async {
//        print("yjhtgfdsyutrgds");
//        var response = await http.post(
//          URL_USERLOGIN, headers: {"Content-Type": "application/json"},
//          body: json.encode(body),);
//
//        print(response.statusCode);
//        if (response.statusCode == 200) {
//          final data = json.decode(response.body);
//
//          print(data);
//          if (!data['err']) {
//            Fluttertoast.showToast(
//                msg: data['msg'].toString(),
//                toastLength: Toast.LENGTH_SHORT,
//                gravity: ToastGravity.BOTTOM,
//                timeInSecForIos: 1,
//                backgroundColor: Colors.grey[700],
//                textColor: Colors.white);
            toHomePage();
//          }
//          else {
//            Fluttertoast.showToast(
//                msg: data['msg'].toString(),
//                toastLength: Toast.LENGTH_SHORT,
//                gravity: ToastGravity.BOTTOM,
//                timeInSecForIos: 1,
//                backgroundColor: Colors.grey[700],
//                textColor: Colors.white);
            setState(() {
              _load=false;
            });
          }
//
//        else {
//          Fluttertoast.showToast(
//              msg: "Sorry, Server Error",
//              toastLength: Toast.LENGTH_SHORT,
//              gravity: ToastGravity.BOTTOM,
//              timeInSecForIos: 1,
//              backgroundColor: Colors.grey[700],
//              textColo}r: Colors.white);
//        }
//      }

//
//      print(body);
//
//      return FutureBuilder(
//
//          future: fetchPosts(http.Client()),
//          builder: (BuildContext context,AsyncSnapshot snapshot){
//            if(snapshot.data==null){
//              return Container(
//                child: Center(
//                  child: CircularProgressIndicator(),
//                ),
//              );
//
//            }
//            else{
//              Fluttertoast.showToast(
//                  msg: "Check Your Connection",
//                  toastLength: Toast.LENGTH_SHORT,
//                  gravity: ToastGravity.BOTTOM,
//                  timeInSecForIos: 1,
//                  backgroundColor: Colors.grey[700],
//                  textColor: Colors.white);
//            }
//          });




  //  }



    else{

      // validation error
      setState(() {
        _validate = true;
      });

    }




  }




}
