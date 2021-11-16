import "package:flutter/material.dart";
import 'package:flutter_meals_app/screens/CategoryMeal_Page.dart';

class categoriesByCountries extends StatelessWidget {
  final String title;
  final Color color;
  final String imagePath;
final String id;
  categoriesByCountries(this.title, this.id,this.color, this.imagePath);
  void _selectCategory(BuildContext CTX) {
    Navigator.of(CTX).pushNamed(CategoryMealPage.CategoryMealPageRoute,arguments: {"id":id,"title":title});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){_selectCategory(context);},
      child: Card(
        elevation: 8,
        shadowColor: color.withOpacity(0.4),
        margin: EdgeInsets.all(15),
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(

            height: 100,
            child: Stack(
              children: [
                Positioned(
                    left: 150,
                    top: 30,
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.bold),
                    )),
                Positioned(
                  left: 20,
                  top: 5,
                  child: Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white)),
                ),
                Positioned(
                  left: 23,
                  top: 8,
                  child: Container(
                      width: 85,
                      height: 85,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              imagePath,
                            ),
                            fit: BoxFit.fill,
                          ))),
                )
              ],
            )),
      ),
    );
  }
}
