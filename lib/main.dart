import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/filters_page.dart';
import 'screens/Categories_page.dart';
import 'screens/CategoryMeal_Page.dart';
import 'screens/DetaildMealPage.dart';

void main() {
  runApp(
      MyApp(), // Wrap your app
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: "Raleway",
          canvasColor: Colors.white,
          accentColor: Color(0xfffe5d51),
          primaryColor: Color(0xfffeb951),
          buttonTheme: ThemeData.light().buttonTheme.copyWith(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.symmetric(horizontal: 30),
                buttonColor: Color(0xfffeb951),
              ),
          textTheme: ThemeData.light().textTheme.copyWith(
              subtitle1: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "RobotoCondensed"),
              button: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              bodyText1: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              bodyText2: TextStyle(
                fontSize: 16,
                color: Color(0xff7E7B5A),
              ))),
      title: 'Flutter Meals App',
      routes: {
        "/":(context) => CategoriesPage(),
        CategoryMealPage.CategoryMealPageRoute: (context) => CategoryMealPage(),
        DetailedMealPage.DetailedMealPageRoute: (context) => DetailedMealPage(),
        Filter_page.RouteName:(context) => Filter_page()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Meals App"),
        ),
        body: Center(
          child: Text("NAVIGATION TIME "),
        ));
  }
}
