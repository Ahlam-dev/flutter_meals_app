import 'package:flutter/material.dart';

import '../CustomDrawer.dart';

class Filter_page extends StatefulWidget {
  static String RouteName = "/Filter-Meals";

  @override
  _Filter_pageState createState() => _Filter_pageState();
}

class _Filter_pageState extends State<Filter_page> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegan = false;
  bool isVegetarian = false;

  Widget buildSwitchList(
      String title, bool currentValue, Function updateValue) {
    return SwitchListTile(
        activeColor: Theme.of(context).primaryColor,
        title: Text(title),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Filters"),
        ),
        drawer: CustomDrawer(),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background-f.jpg"),
                  fit: BoxFit.fill)),
          child: Center(
            child: Container(
              alignment: Alignment.centerLeft,
              width: 330,
              height: 300,
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white70,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Food Type"),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.only(top: 10),
                        children: [
                          buildSwitchList("Gluten Free", isGlutenFree,
                              (newValue) {
                            setState(() {
                              isGlutenFree = newValue;
                            });
                          }),
                          buildSwitchList("Lactose Free", isLactoseFree,
                              (newValue) {
                            setState(() {
                              isLactoseFree = newValue;
                            });
                          }),
                          buildSwitchList("Vegan", isVegan, (newValue) {
                            setState(() {
                              isVegan = newValue;
                            });
                          }),
                          buildSwitchList("Vegetarian", isVegetarian,
                              (newValue) {
                            setState(() {
                              isVegetarian = newValue;
                            });
                          })
                        ],
                      ),
                    )
                  ]),
            ),
          ),
        ));
  }
}
