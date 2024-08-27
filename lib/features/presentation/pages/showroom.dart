// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rental_ui/core/utils/constants.dart';
import 'package:rental_ui/features/presentation/pages/available_cars.dart';
import 'package:rental_ui/features/presentation/pages/book_car.dart';
import 'package:rental_ui/features/presentation/widgets/car_card.dart';
import 'package:rental_ui/features/presentation/widgets/dealer_card.dart';

import '../../Cars/data/data.dart';

class ShowRoom extends StatefulWidget {
  const ShowRoom({super.key});

  @override
  State<ShowRoom> createState() => _ShowRoomState();
}

class _ShowRoomState extends State<ShowRoom> {
  List<NavigationItem> navigationItems =
      getNavigationItemList(); //access thedata
  late NavigationItem selectedItem;
  List<Car> cars = getCarList();
  List<Dealer> dealers = getDealerList();

  @override
  void initState() {
    super.initState();
    setState(() {
      selectedItem = navigationItems[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Car Rental App',
            style: GoogleFonts.mulish(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: false,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: Icon(
                Icons.menu,
                color: Colors.black,
                size: 28,
              ),
            )
          ],
        ),
        bottomNavigationBar: Container(
          height: 70,
          //color: Colors.white,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: buildNavigationItems(),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: const TextStyle(fontSize: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(width: 0, style: BorderStyle.none),
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.only(left: 30),
                      suffixIcon: const Padding(
                        padding: EdgeInsets.only(left: 16.0, right: 24.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      )),
                ),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('TOP DEALS',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[400])),
                          Row(
                            children: [
                              Text('View all',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryColor)),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: kPrimaryColor,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: 280,
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: buildDeals(),
                        )),
                    GestureDetector(
                      onTap: () {
                        print('in the gesture dector');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AvailableCars()));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 16,
                          left: 16,
                          right: 16,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          padding: EdgeInsets.all(20),
                          height: 100,
                          child: Row(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Available Cars',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Long term and Short term',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      //fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  height: 50,
                                  width: 50,
                                  //color: Colors.white,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(14))),
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: kPrimaryColor,
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('TOP DEALERS',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[400])),
                          Row(
                            children: [
                              Text('View all',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: kPrimaryColor)),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 12,
                                color: kPrimaryColor,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                    //dealer widget
                    Container(
                        height: 150,
                        margin: EdgeInsets.only(bottom: 16),
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: buildDealers(),
                        )),
                  ],
                ),
              ),
            ))
          ],
        ));
  }

  List<Widget> buildDeals() {
    List<Widget> list = [];
    for (var i = 0; i < cars.length; i++) {
      list.add(GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BookCar(car: cars[i])));
          },
          child: buildCars(cars[i], i)));
    }
    return list;
  }

  List<Widget> buildDealers() {
    List<Widget> list = [];
    for (var i = 0; i < dealers.length; i++) {
      list.add(buildDealer(dealers[i], i));
    }
    return list;
  }

  List<Widget> buildNavigationItems() {
    List<Widget> list = [];
    for (var i = 0; i < navigationItems.length; i++) {
      list.add(buildNavigationItem(navigationItems[i]));
    }
    return list;
  }

  Widget buildNavigationItem(NavigationItem item) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedItem = item;
        });
      },
      child: Container(
        width: 50,
        child: Stack(
          children: [
            selectedItem == item
                ? Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: kPrimaryColorShadow),
                    ),
                  )
                : Container(),
            Center(
              child: Icon(item.iconData,
                  color:
                      selectedItem == item ? kPrimaryColor : Colors.grey[400],
                  size: 24),
            )
          ],
        ),
      ),
    );
  }
}
