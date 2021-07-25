// import 'dart:html';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intership_project/cart.dart';
// ignore: unused_import
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intership_project/constants.dart';
// import 'package:google_fonts/google_fonts.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_pro/carousel_pro.dart';
// ignore: unused_import
import 'package:intership_project/item.dart';
// ignore: unused_import
import 'package:intership_project/product.dart';
import 'package:email_auth/email_auth.dart';
// ignore: unused_import
import 'package:intership_project/detailscreen.dart';

class homescreen extends StatefulWidget {  
  @override
  _homescreenState createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  
  

  // void _sendSMS(String message, List<String> recipents) async {
  //  String _result = await sendSMS(message: message, recipients: recipents)
  //         .catchError((onError) {
  //       print(onError);
  //     });
  // print(_result);
  // }

  // String message = "Welcome to DIVYANG.COM";
  // List<String> recipents = ["8780437949"];

  @override
  Widget build(BuildContext context) {
  Widget image_carousel = new Container(
    height: 300.0,
    child: new Carousel(
      boxFit: BoxFit.cover,
      // dotColor: Colors.,
      dotSize: 5,
      dotBgColor: Colors.transparent,
      images: [
        AssetImage('assets/banner/b1.jpg'),
        AssetImage('assets/banner/b2.jpg'),
        AssetImage('assets/banner/b3.jpg'),
        // AssetImage('assets/banner/b4.jpg'),
      ],
      autoplay: true,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
    ),
  );
  
  return new Scaffold(    
    resizeToAvoidBottomInset: false,
    backgroundColor: BackColor,
    appBar: buildAppBar(context),
    body:Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            child: image_carousel,
            margin: EdgeInsets.only( bottom : DefaultPaddin ),              
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: DefaultPaddin),
            child: hi()
              
          ),
        ),    
      ],
    ),
  );
}

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: aappbarColor),
      centerTitle: true,
      backgroundColor: aappbarColor,
      brightness: Brightness.light,
      // elevation: 0,
      leading: IconButton(
        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => drawerscreen() ) );},
        icon: Icon(Icons.menu_rounded, color: Colors.black),
      ),
      title: InkWell(
           child: Text('DIVYANG', style: ( TextStyle(color: Colors.black , fontFamily: 'bodoni moda') ), ),
            // onTap: () =>  _sendSMS(message, recipents),
          ),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search, color: Colors.black),
        ),
        IconButton(
           onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => cartscreen() ) );
          },
          icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
        ),
        SizedBox( width: DefaultPaddin/2 )
      ],
    );
  }
}

class drawerscreen extends StatelessWidget {  
  final String _emailController = "parmardivyang159@gmail.com";
  void sendOtp()async{
       EmailAuth.sessionName = "Sample";
    var data = await EmailAuth.sendOtp ( receiverMail : _emailController) ;
    if(!data){
    }
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text('Hello, Divyang', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 25 , fontWeight: FontWeight.bold),)
            ),
            decoration: BoxDecoration(
              color: Colors.black
            ),
          ),
          ListTile(
            title: Text('GIFTS', style: TextStyle(color: MWordColor, fontSize: 25 ),),
            onTap: () => sendOtp(),
            leading: Icon(Icons.card_giftcard_rounded, color: MIconColor),
          ),
          ListTile(
            title: Text("WHAT'S NEW", style: TextStyle(color: MWordColor, fontSize: 25  ),),
            onTap: () => {},
            leading: Icon(Icons.monetization_on_outlined, color: MIconColor),
          ),
          ListTile(
            title: Text('MEN', style: TextStyle(color: MWordColor, fontSize:25  ),),
            onTap: () => {},
            leading: Icon(Icons.male_outlined, color: MIconColor),
          ),
          ListTile(
            title: Text('WOMEN', style: TextStyle(color: MWordColor, fontSize:25  ),),
            onTap: () => {},
            leading: Icon(Icons.female_outlined, color: MIconColor),
          ),
          ListTile(
            title: Text('CHILDREN', style: TextStyle(color: MWordColor, fontSize:25  ),),
            onTap: () => {},
            leading: Icon(Icons.child_care, color: MIconColor),
          ),
          ListTile(
            title: Text('SAVED ITEMS', style: TextStyle(color: MWordColor, fontSize:25  ),),
            onTap: () => {
            Navigator.push(context, MaterialPageRoute(builder: (context) => cartscreen(),), ),
            },
            leading: Icon(Icons.bookmark_sharp, color: MIconColor),
          ),
          ListTile(
            title: Text('Divyang Inc.', textAlign: TextAlign.left, style: TextStyle(color: ttextLightColor)),
            leading: Icon(Icons.copyright_outlined, color: ttextLightColor),
          ),
        ],
      ),
    );
  }
}