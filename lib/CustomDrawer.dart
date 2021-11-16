import 'package:flutter/material.dart';
import 'package:flutter_meals_app/screens/filters_page.dart';

class CustomDrawer extends StatelessWidget {
  Widget buildListTile(BuildContext context, IconData myicon, String text, Function tapLink) {
    return ListTile(
      leading: Icon(
        myicon,
        color: Color(0xfffe5d51),
        size: 30,
      ),
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 18),
      ),
      onTap: tapLink,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(40)),
                gradient: LinearGradient(colors: [
                  Theme.of(context).accentColor,
                  Theme.of(context).primaryColor
                ])),
            width: double.infinity,
            height: 160,
            child: Text("cook up !",style: Theme.of(context).textTheme.subtitle1,),
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 30),
          ),
          buildListTile(context, Icons.restaurant_menu, "All Recipes",
              (){Navigator.of(context).pushReplacementNamed("/");
          }),
          SizedBox(
            height: 5,
          ),
          buildListTile(context, Icons.settings, "Filters",
              (){Navigator.of(context).pushReplacementNamed(Filter_page.RouteName);}),
        ],
      ),
    );
  }
}
