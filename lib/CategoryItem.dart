import 'package:flutter/material.dart';

import 'screens/CategoryMeal_Page.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final String Id;
  final String imagePath;
  CategoryItem(this.Id,this.title, this.imagePath);

  void _selectCategory(BuildContext CTX) {
    Navigator.of(CTX).pushNamed(CategoryMealPage.CategoryMealPageRoute,arguments: {"id":Id,"title":title});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _selectCategory(context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Image.asset(
              imagePath,
              width: 220,
              height: 200,
            ),
          ),
          Text(title, style: Theme.of(context).textTheme.bodyText2)
        ],
      ),
    );
  }
}
