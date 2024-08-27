// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rental_ui/features/data/data.dart';

Widget buildDealer(Dealer dealer, int index) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(16))
    ),
    width: 150,
   // height: 100,
    margin: EdgeInsets.only(
        right: index != null ? 16 : 0, left: index != null ? 16 : 0),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(2),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(dealer.image), fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(15))),
            //child: Image.asset(dealer.image,fit: BoxFit.fitWidth,),
            height: 60,
            width: 60,
          ),
          SizedBox(height: 10,),
          Text(dealer.name,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20, height: 1),),
         // SizedBox(height: 8,),
          Text(dealer.offers.toString() + " offers", style: TextStyle(color: Colors.grey[400], fontSize: 14),)
        ],
      ),
    ) ,
  );
   
}
