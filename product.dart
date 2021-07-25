// import 'dart:js';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:intership_project/homescreen.dart';
import 'package:intership_project/item.dart';

import 'constants.dart';
import 'detailscreen.dart';

class Product {
  final String image, name , description ;
  final int id  , price, size ;
  final Color color , fontcolor ;
  final List sizes;
Product({
  required this.id,
  required this.image,
  required this.name,
  required this.price,
  required this.description,
  required this.size,
  required this.color,
  required this.fontcolor,
  required this.sizes
});
}

List<Product> products = [
  Product(
      id: 1,
      image: "assets/product/p1.jpg",
      name: "Puma Sneaker",
      price: 2099,
      size: 12,
      description: des,
      fontcolor: Colors.black,
      // color: Color(0xFF3D82AE)
      color : const Color.fromRGBO(254, 167, 0, 1),
      sizes: ["5","6","7","8","9","10"],
    ),
  Product(
      id: 2,
      name: "Nike React Miler 2",
      price: 11495,
      size: 8,
      description: des,
      image: "assets/product/p2.jpg",
      fontcolor: Colors.black,
      // color: Color(0xFFD3A984)
      color : Color.fromRGBO(208, 2, 28, 1),
      sizes: ["5","6","7","8","9","10"],
    ),
  Product(
      id: 3,
      name: "Nike Sneaker",
      price: 5099,
      size: 10,
      description: des,
      image: "assets/product/p3.jpg",
      fontcolor: Colors.black,
      // color: Color(0xFF989493)
      color : Color.fromRGBO(223, 145, 29, 1),
      sizes: ["5","6","7","8","9","10"],
    ),
  Product(
      id: 4,
      name: "WoodLand Men's",
      price: 2999,
      size: 11,
      description: des,
      image: "assets/product/p4.jpg",
      fontcolor: Colors.black,
      // color: Color(0xFFE6B398)
      color : Color.fromRGBO(89, 54, 32, 1),
      sizes: ["5","6","7","8","9","10"],
    ),
  Product(
      id: 5,
      name: "Office Code",
      price: 234,
      size: 12,
      description: des,
      image: "assets/product/p5.jpg",
      fontcolor: Colors.black,
      // color: Color(0xFFFB7883)
      color : Colors.white,
      sizes: ["5","6","7","8","9","10"],
    ),
  // Product(
  //   id: 6,
  //   name: "Office Code",
  //   price: 234,
  //   size: 12,
  //   description: des,
  //   image: "assets/product/p6.jpg",
  //   fontcolor: Colors.black,
  //   // color: Color(0xFFAEAEAE),
  //     color : Color.fromRGBO(51, 52, 63, 1),
      // sizes: ["5","6","7","8","9","10"],
  // ),
  Product(
    id: 6,
    name: "Nike Air",
    price: 12495,
    size: 12,
    description: des,
    image: "assets/product/p7.jpg",
    fontcolor: Colors.black,
    color : Color.fromRGBO(0, 140, 255, 1),
    sizes: ["5","6","7","8","9","10"],
    // color: Color(0xFFAEAEAE),
  ),
  Product(
    id: 7,
    name: "Nike Pegasus Trail 3",
    price: 11299,
    size: 12,
    description: des,
    image: "assets/product/p8.jpg",
    fontcolor: Colors.black,
    // color: Color(0xFFAEAEAE),
    color : Colors.black,
    sizes: ["5","6","7","8","9","10"],
  ),
  Product(
    id: 8,
    name: "Office Code",
    price: 234,
    size: 12,
    description: des,
    image: "assets/product/p9.jpg",
    fontcolor: Colors.black,
    // color: Color(0xFFAEAEAE),
    color : Color.fromRGBO(160, 217, 237, 1),
    sizes: ["5","6","7","8","9","10"],
  ),
  Product(
    id: 9,
    name: "Office Code",
    price: 234,
    size: 12,
    description: des,
    image: "assets/product/p10.jpg",
    // color: Color(0xFFAEAEAE),
    fontcolor: Colors.black,
    color : Color.fromRGBO(163, 181, 181, 1),
    sizes: ["5","6","7","8","9","10"],
  ),
  Product(
    id: 10,
    name: "Office Code",
    price: 234,
    size: 12,
    description: des,
    image: "assets/product/p11.jpg",
    fontcolor: Colors.black,
    // color: Color(0xFFAEAEAE),
    color : Color.fromRGBO(224, 189, 185, 1),
    sizes: ["5","6","7","8","9","10"],
  ),
];

String des = "This is my intership project of E-commerce Flutter project.";
class hi extends StatefulWidget {
  // const hi({Key? key}) : super(key: key);

  @override
  _hiState createState() => _hiState();
}

class _hiState extends State<hi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
              itemCount: products.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: DefaultPaddin,
                crossAxisSpacing: DefaultPaddin,
                childAspectRatio: 0.6 ,
              ) ,
              itemBuilder: ( BuildContext context , int index ) => itemcard(product: products[index], press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => details(product: products[index]) )), ),
            ),
    );
  }
}