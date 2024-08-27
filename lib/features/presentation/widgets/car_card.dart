// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:rental_ui/core/utils/constants.dart';
import 'package:rental_ui/features/data/data.dart';

Widget buildCars(Car car, int? index) {
  return Container(
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16.0))),
    width: 220,
    margin: EdgeInsets.only(
        right: index != null ? 16 : 0, left: index != null ? 16 : 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                car.condition,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          height: 120,
          child: Center(
            child: Hero(
              tag: car.model,
              child: Image.asset(
                car.images[0],
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
       SizedBox(height: 8,),
       Text(car.model, style: TextStyle(fontSize: 18, ),),
       SizedBox(height: 8,),
       Text(car.brand, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,height: 1),), 
       SizedBox(height: 8,),
       Text(
        "per " + (car.condition == "Daily" ? "day" : car.condition == "Weekly" ? "week" : "Month" ),
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey,
         // height: 1
        ),

       ),

      ],
    ),
  );
}
