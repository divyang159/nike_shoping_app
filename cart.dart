import 'package:flutter/material.dart';
import 'package:intership_project/constants.dart';
import 'package:intership_project/homescreen.dart';

class cartscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BackColor,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: aappbarColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.black),
          ),
          title: InkWell(
           child: Text('DIVYANG', style: ( TextStyle(color: Colors.black , fontFamily: 'bodoni moda') ), ),
            onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => homescreen() ) ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: Colors.black),
            ),
          ]
      ),
      body: new Container(
        child: Align(
          alignment: Alignment.center,
          child: new Image.asset('assets/cart/cart.gif', height: 300,),
      ),
      )
    );
  }
}