import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meals_app/ui/BaseWidget.dart';
import '../CategoryItem.dart';
import '../CustomDrawer.dart';
import '../categoriesByCountries.dart';
import '../dummy_data.dart';

class CategoriesPage extends StatelessWidget {
  var appbar = AppBar(
    iconTheme: IconThemeData(color: Colors.black),

    actions: [
      Card(
        color: Color(0xfffeb951),
        elevation: 5,
        shadowColor: Colors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: IconButton(
            iconSize: 25,
            icon: Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
            onPressed: () {}),
      ),
    ],
    backgroundColor: Colors.white,
    elevation: 0,
    title: Text(
      "Recipes",
      style: TextStyle(
          color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 24),
    ),
  );
  @override
  Widget build(BuildContext context) {

      return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: appbar,
          drawer: CustomDrawer(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: (MediaQuery.of(context).padding.top +
                              appbar.preferredSize.height) *
                          0.3,
                      bottom: 20,
                      left: 15),
                  child:
                     Text("Recipes By Meal ",
                        style:
                        Theme.of(context).textTheme.bodyText1),
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 300,
                    scrollDirection: Axis.horizontal,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    viewportFraction: 0.6,
                  ),
                  items: CATEGORIES_by_MealTybe.map((item) {
                    // ignore: missing_return
                    return CategoryItem(item.id,item.title, item.imagePath);
                  }).toList(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0, bottom: 0, left: 20),
                  child: Text("Recipes By Country ",
                      style:
                           Theme.of(context).textTheme.bodyText1)),
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 330,
                    child: ListView(
                      children: CATEGORIES_byCountry.map((item) {
                        return categoriesByCountries(
                            item.title, item.id,my_color[counter++], item.imagePath);
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),);


  }

  var counter = 0;
  final my_color = [Color(0xfffeb951), Color(0xfffe5d51), Color(0xffA9CA50)];
}
