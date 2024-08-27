// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rental_ui/core/utils/constants.dart';
import 'package:rental_ui/features/Cars/data/data.dart';
import 'package:rental_ui/features/presentation/pages/book_car.dart';
import 'package:rental_ui/features/presentation/widgets/car_card.dart';

class AvailableCars extends StatefulWidget {
  const AvailableCars({super.key});

  @override
  State<AvailableCars> createState() => _AvailableCarsState();
}

class _AvailableCarsState extends State<AvailableCars> {
  List<Filter> filters = getFilterList();
  late Filter selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
          child: Container(
        //color: Colors.grey[100],
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    border: Border.all(color: Colors.grey[300]!, width: 1)),
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.black,
                  size: 28,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "Available Cars (" + getCarList().length.toString() + ")",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.black),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
                child: GridView.count(
                    physics: BouncingScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 1 / 1.75,
                    children: getCarList().map((item) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookCar(car: item,)));
                          },
                          child: buildCars(item, null));
                    }).toList()))
          ],
        ),
      )),
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildFilterIcon(),
            Row(
              children: buildFilters(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildFilterIcon() {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Icon(
        Icons.filter_list,
        color: Colors.white,
      ),
    );
  }

  List<Widget> buildFilters() {
    List<Widget> list = [];
    for (var i = 0; i < filters.length; i++) {
      list.add(buildFilter(filters[i]));
    }
    return list;
  }

  Widget buildFilter(Filter filter) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = filter;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Text(
          filter.name,
          style: TextStyle(
              color:
                  selectedFilter == filter ? kPrimaryColor : Colors.grey[300],
              fontWeight: selectedFilter == filter
                  ? FontWeight.bold
                  : FontWeight.normal,
              fontSize: 14),
        ),
      ),
    );
  }
}
