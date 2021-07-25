// import 'dart:js';

// ignore: import_of_legacy_library_into_null_safe
// ignore: unused_import
// import 'dart:js';

// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intership_project/product.dart';
import 'cart.dart';
import 'constants.dart';
import 'homescreen.dart';

class details extends StatefulWidget {
  final Product product;
  const details({Key? key, required this.product}) : super(key: key);

  @override
  _detailsState createState() => _detailsState();
}

class _detailsState extends State<details> {
  int activeSize = 0;
  @override
  Widget build(BuildContext context) {
  Widget image_carousel = new Container(
    height: 350.0,
    child: new Carousel(
      // boxFit: BoxFit.fill,
      // dotColor: Colors.,
      // dotSize: 5,
      dotBgColor: Colors.transparent,
      images: [
        AssetImage(widget.product.image),
        // AssetImage('assets/banner/b2.jpg'),
        // AssetImage('assets/banner/b3.jpg'),
        // AssetImage('assets/banner/b4.jpg'),
      ],
      autoplay: false,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
    ),
  );
  return Scaffold(
    backgroundColor: BackColor,
    appBar: buildAppBar(context),
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            child: image_carousel,
          ),
          SizedBox( height:  DefaultPaddin ),
          Padding(
            padding: const EdgeInsets.only(left: DefaultPaddin, right: DefaultPaddin),
            child: Text(widget.product.name,style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600, height: 1.5, color: widget.product.fontcolor, ),),
          ),
          SizedBox( height:  DefaultPaddin ),
          Padding(
            padding: const EdgeInsets.only(left: DefaultPaddin, right: DefaultPaddin),
            child: Text("Rs: ${widget.product.price}",style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, height: 1, color: widget.product.fontcolor, ),),
          ),
          SizedBox( height:  DefaultPaddin ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("description: ${ widget.product.description }",style: TextStyle(fontSize: 15, color: widget.product.fontcolor, ),),
          ),
          SizedBox( height:  DefaultPaddin ),
          Padding(
            padding: const EdgeInsets.only(left: DefaultPaddin, right: DefaultPaddin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Style",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: widget.product.fontcolor, ),),
                TextButton(
                  onPressed: () {
                    _sizescreen(context);
                  },
                  child: Text("Size Chart",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: widget.product.fontcolor.withOpacity(0.6),),),
                )
              ]
            )
          ),
          SizedBox(height: 5),
          Padding(
            padding: EdgeInsets.only(left: 20,right: 25),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(widget.product.sizes.length, (index){
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        activeSize = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15,bottom: 5),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: activeSize == index ? widget.product.color : Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(
                            spreadRadius: 0.5,
                            blurRadius: 1,
                            color: Colors.black.withOpacity(0.1)
                          )]
                        ),
                        child: Center(
                          child: Text("${widget.product.sizes[index]} UK",style: TextStyle(            
                            fontSize: 22,
                            color: activeSize == index ? widget.product.fontcolor : Colors.black
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          SizedBox(width: 15,),
          Padding(
            padding: EdgeInsets.only(left: 20,right: 20, top : 20),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * .40 ,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Add to cart", style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600),),
                  ),
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * .40 ,
                  decoration: BoxDecoration(
                    color: widget.product.color,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextButton(
                    onPressed: () {_colscreen(context);},
                    child: Text("Buy Now", style: TextStyle(color: widget.product.fontcolor,fontSize: 15,fontWeight: FontWeight.w600),),
                  ),
                ),
              ]
            ),
          ),
        ],
      ),
    ),    
  );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: aappbarColor),
      backgroundColor: aappbarColor,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_sharp, color: widget.product.fontcolor),
        ),
      title: InkWell(
        child: Text('DIVYANG', style: ( TextStyle(color: Colors.black , fontFamily: 'bodoni moda') ), ),
        onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => homescreen() ) ),
      ),
      actions: <Widget>[
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.search, color: widget.product.fontcolor),
      ),
      IconButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => cartscreen() ) );
        },
        icon: Icon(Icons.shopping_cart_outlined, color: widget.product.fontcolor),
      ),
      SizedBox( width: DefaultPaddin/2 )
      ]
    );
  }
  void _sizescreen(context) {
    showModalBottomSheet(context: context, builder: (BuildContext bc) {
      return SingleChildScrollView( 
        child: Container(
        height: MediaQuery.of(context).size.height * .50 ,
        child: Padding(
          padding: const EdgeInsets.all(8.0),        
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("size Table", style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600, height: 1.5, color: widget.product.fontcolor, ),),
                  IconButton(
                    onPressed: () { Navigator.of(context).pop(); },
                    icon: Icon(Icons.cancel, color:  Colors.redAccent[700], size: 25,),
                  )
                ],
              ),
              Image.asset("assets/size/size.JPG"),
            ],
          ),
        ),
      ),
    );
    });
  }
  void _colscreen(context) {
    showModalBottomSheet(context: context, builder: (BuildContext bc) {
      return SingleChildScrollView( 
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(36, 36, 36, 1),
          ),
        height: MediaQuery.of(context).size.height * .50 ,
        child: Padding(
          padding: const EdgeInsets.all(8.0),        
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Center(
                    child: Text("Congratulations", style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600, height: 1.5, color: Colors.white, ),),
                  ),
                  IconButton(
                    onPressed: () { Navigator.of(context).pop(); },
                    icon: Icon(Icons.cancel, color:  Colors.redAccent[700], size: 25,),
                  )
                ],
              ),
              Center(
                child: new Image.asset('assets/size/tenor.gif'),
              ),
              Center(
                    child: Text("Order Successfully Placed", style: TextStyle(fontSize: 15, color: Colors.white, ),),
              )
            ],
          ),
        ),
      ),
    );
    });
  }
}