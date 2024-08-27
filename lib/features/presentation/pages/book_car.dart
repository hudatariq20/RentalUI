// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:rental_ui/core/utils/constants.dart';

import '../../Cars/data/data.dart';

class BookCar extends StatefulWidget {
  final Car car;
  //late String selected;
  const BookCar({super.key, required this.car});

  @override
  State<BookCar> createState() => _BookCarState();
}

class _BookCarState extends State<BookCar> {
  late int caritem;
  //int _currentImage =0;

  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
    setState(() {
      caritem = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //add the stuff on the top
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  border: Border.all(
                                      color: Colors.grey[300]!, width: 1)),
                              child: Icon(
                                Icons.keyboard_arrow_left,
                                color: Colors.black,
                                size: 28,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    border: Border.all(
                                        color: Colors.grey[300]!, width: 1)),
                                child: Icon(
                                  Icons.bookmark_border_outlined,
                                  color: Colors.white,
                                  size: 22,
                                ),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                    border: Border.all(
                                        color: Colors.grey[300]!, width: 1)),
                                child: Icon(
                                  Icons.share,
                                  color: Colors.black,
                                  size: 22,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height:20
                      ),
                      //CAR MODEL
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          widget.car.model,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 36),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      //CAR BRAND
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          widget.car.brand,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.grey[400]),
                        ),
                      ),
                
                      SizedBox(
                        height: 5,
                      ),
                      //add the car image -> product carousel //
                
                      SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            CarouselSlider(
                              items: buildImage(widget.car),
                              options: CarouselOptions(
                                enlargeCenterPage: true,
                                height: 200,
                                aspectRatio: 7/ 2,
                                viewportFraction: 1.1,
                                onPageChanged: (index, reason) {
                                  caritem = index;
                                  setState(() {});
                                },
                              ),
                            ),
                            widget.car.images.length >= 1
                                ? Container(
                                  height: 30,
                                  child: DotsIndicator(
                                      dotsCount: widget.car.images.length,
                                      position: caritem,
                                      decorator: DotsDecorator(
                                        activeColor: Colors.black,
                                        color: Colors.grey,
                                        size: const Size.square(9.0),
                                        activeSize: const Size(20.0, 9.0),
                                        activeShape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                      ),
                                    ),
                                )
                                : Container(),
                          ],
                        ),
                      ),
                      //add the logic to display empty container when no cars images are present.
                      ////refine this logic
                      ///work on why they used page builder and how build dots without dot indicator
                      //add the cards for prices.
                      //right now the priorty is complete the UI.
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildPricePeriod("12", "4,350", true),
                          SizedBox(
                            width: 12,
                          ),
                          buildPricePeriod("6", "4,800", false),
                          SizedBox(
                            width: 12,
                          ),
                          buildPricePeriod("1", "5100", false),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              Container(
                //padding : const EdgeInsets.only(left: 8.0,),
               //height: 90,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SPECIFICATIONS',
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 8),
                        height: 80,
                        margin: EdgeInsets.only(bottom: 10),
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: [
                            buildSpecificationCar("Color","White" ),
                            buildSpecificationCar("Gearbox","Automatic" ),
                            buildSpecificationCar("Seat","4" ),
                            buildSpecificationCar("Motor","v10.2.0" ),
                            buildSpecificationCar("Speed (0-100)","3.2 sec" ),
                            buildSpecificationCar("Top Speed","121 mph" )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
      bottomNavigationBar: Container(
        height: 90,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("12 Month" , style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),),
                SizedBox(height: 4,),
                Row(
                  
                  children: [
                    Text("AED 4,325", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                    SizedBox(width: 8,),
                    Text("per Month", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 14),),
                  ],
                )
              ],
            ),

            Container(
              height: 50,
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(Radius.circular(15)),

              ),
              child: Center(
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("Book this car", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                ),
              ),
            )
          ],
        )
      ),
    );
  }

  Widget buildSpecificationCar(String title, String data) {
    return Container(
      width: 130,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(color: Colors.grey[400], fontSize: 14),),
          SizedBox(height: 8,),
          Text(data, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)
        ]),
    );
  }

  Widget buildPricePeriod(String months, String price, bool selected) {
    return Expanded(
      child: Container(
        height: 110,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: selected ? kPrimaryColor : Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
            border:
                Border.all(color: Colors.grey[300]!, width: selected ? 0 : 1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              months + " Month",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selected ? Colors.white : Colors.black,
                  fontSize: 14),
            ),
            SizedBox(
              height: 16,
            ),
            Text(price,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: selected ? Colors.white : Colors.black,
                    fontSize: 20)),
            Text(
              "USD",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: selected ? Colors.white : Colors.black,
                  fontSize: 15),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> buildImage(Car car) {
    return car.images.map<Widget>((i) {
      return Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              width: double.infinity,
              height: 800,
              child: Hero(
                tag: widget.car.model,
                child: Image.asset(
                  i,
                  fit: BoxFit.scaleDown,
                ),
              ),
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //   fit: BoxFit.scaleDown,
              //   image: AssetImage(i),
              // ))
            ),
          );
        },
      );
    }).toList();
  }
}
