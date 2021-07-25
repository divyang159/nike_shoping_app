import 'package:flutter/material.dart';
import 'package:intership_project/product.dart';
import 'package:intership_project/constants.dart';

class itemcard extends StatelessWidget {
  final Product product;
  final VoidCallback press;
  const itemcard({Key? key, required this.product , required this.press }) : super(key: key);
  @override
  Widget build(BuildContext context) { 
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              // padding: EdgeInsets.all(  KDefaultPaddin ),
              // height: 180,
              // width: 160,
              // decoration: BoxDecoration(
              //   color: product.color,
              // ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(product.image, fit: BoxFit.fill,),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric( vertical: DefaultPaddin / 4 ),
            child: Text(product.name, style: TextStyle(color : ttextLightColor),
            ), 
          ), 
          Text("Rs: ${product.price}", style: TextStyle(fontWeight: FontWeight.bold,) ),
        ],
      ),
    );
  }
}
