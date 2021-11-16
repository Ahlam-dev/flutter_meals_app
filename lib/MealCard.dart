import "package:flutter/material.dart";
import 'package:flutter_meals_app/Module/Meal.dart';
import 'package:flutter_meals_app/screens/DetaildMealPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MealCard extends StatelessWidget {
  Meal MealInfo;
  Function f;
  MealCard(this.MealInfo, this.f);
  void _selectedMeal(BuildContext context) {
    Navigator.of(context).pushNamed(DetailedMealPage.DetailedMealPageRoute,
        arguments:  MealInfo.id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectedMeal(context),
      borderRadius: BorderRadius.circular(10),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              ClipRRect(
                child: Image.network(
                  MealInfo.imageUrl,
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, bottom: 15, right: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          MealInfo.title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontSize: 16),
                        ),
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 20,
                                color: Color(0xffA9CA50),
                              ),
                              SizedBox(
                                height: 40,
                                width: 5,
                              ),
                              FittedBox(
                                child: Text(
                                  "${MealInfo.duration} min",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(fontSize: 14),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                child: FaIcon(
                                  FontAwesomeIcons.utensils,
                                  size: 20,
                                  color: Color(0xffA9CA50),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              FittedBox(
                                child: Text(
                                  f(MealInfo.complexity),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
