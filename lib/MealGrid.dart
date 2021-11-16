import 'package:flutter/material.dart';

import 'Module/Meal.dart';
import 'screens/DetaildMealPage.dart';

class MealGrid extends StatelessWidget {
  Meal MealInfo;

  MealGrid(this.MealInfo);

  void _selectedMeal(BuildContext context) {
    Navigator.of(context).pushNamed(DetailedMealPage.DetailedMealPageRoute,
        arguments:  MealInfo.id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectedMeal(context),
      borderRadius: BorderRadius.circular(15),
      child: Card(
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                child: Image.network(
                  MealInfo.imageUrl,
                  fit: BoxFit.cover,
                  color: Colors.black26,
                  colorBlendMode: BlendMode.overlay,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              Positioned(
                left: 15,
                top: 110,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    MealInfo.title,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: 16,
                        color: Colors.white,
                        shadows: [
                          Shadow(color: Colors.white70, blurRadius: 2)
                        ]),
                  ),
                ),
              ),
              Positioned(
                  right: 10,
                  bottom: 1,
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 40,
                        width: 5,
                      ),
                      FittedBox(
                        child: Text(
                          "${MealInfo.duration} min",
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                              fontSize: 14,
                              color: Colors.white,
                              shadows: [
                                Shadow(color: Colors.white70, blurRadius: 2)
                              ]),
                        ),
                      )
                    ],
                  )),
            ],
          )),
    );
  }
}
