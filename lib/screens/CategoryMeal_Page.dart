import 'package:flutter/material.dart';
import 'package:flutter_meals_app/Module/Meal.dart';
import '../MealGrid.dart';
import '../MealCard.dart';
import '../MyCookingIcon.dart';
import '../dummy_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryMealPage extends StatefulWidget {
  static const CategoryMealPageRoute = "/Category-Meals";

  @override
  _CategoryMealPageState createState() => _CategoryMealPageState();
}

class _CategoryMealPageState extends State<CategoryMealPage> {
  Color listButtonPressed = Colors.orange;
  Color gridButtonPressed = Colors.grey;
  bool isList = true;

  @override
  Widget build(BuildContext context) {
    final Meals_data =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final Category_Id = Meals_data['id'];
    final title = Meals_data['title'];

    String getComplexity(Complexity complexity) {
      switch (complexity) {
        case Complexity.Simple:
          return "Simple";
        case Complexity.Challenging:
          return "Challenging";
        case Complexity.Hard:
          return "Hard";
        default:
          return "Unknown";
      }
    }

    var appBar = AppBar(
      leading: IconButton(
          iconSize: 35,
          icon: Icon(
            Icons.list,
            color: Color(0xfffeb951),
          ),
          onPressed: () {}),
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
        title,
        style: TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 24),
      ),
    );

    final meals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(Category_Id);
    }).toList();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar,
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.filter_list),
                  color: listButtonPressed,
                  onPressed: () {
                    setState(() {
                      listButtonPressed = Colors.orange;
                      gridButtonPressed = Colors.grey;
                      isList = true;
                    });
                  },
                  iconSize: 30,
                ),
                IconButton(
                  icon: Icon(Icons.grid_on),
                  color: gridButtonPressed,
                  onPressed: () {
                    setState(() {
                      listButtonPressed = Colors.grey;
                      gridButtonPressed = Colors.orange;
                      isList = false;
                    });
                  },
                  iconSize: 30,
                )
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          ),
          Container(
              height: 530,
              child: isList
                  ? ListView.builder(
                      itemBuilder: (ctx, index) {
                        return MealCard(meals[index],getComplexity);
                      },
                      itemCount: meals.length,
                    )
                  : GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 20.0),
                      itemBuilder: (context, index) {
                        return MealGrid(meals[index]);
                      },
                      itemCount: meals.length,
                    )),
        ]));
  }
}
