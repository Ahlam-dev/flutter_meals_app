import 'package:flutter/material.dart';
import 'package:flutter_meals_app/dummy_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_dash/flutter_dash.dart';

class DetailedMealPage extends StatefulWidget {
  static const DetailedMealPageRoute = "/Meal-details";

  @override
  _DetailedMealPageState createState() => _DetailedMealPageState();
}

class _DetailedMealPageState extends State<DetailedMealPage> {
  Widget _buildText(BuildContext context, String text) {
    return FittedBox(
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 14),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Meal_details = ModalRoute.of(context).settings.arguments as String;
    final meal =
        DUMMY_MEALS.firstWhere((element) => element.id == Meal_details);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
            backgroundColor: Colors.transparent,
            elevation: 0,

            actions: [
              IconButton(
                iconSize: 30,
                icon: Icon(Icons.favorite_border),
                color: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
          extendBodyBehindAppBar: true,
          body: Column(children: [
            Stack(
              overflow: Overflow.visible,
              children: [
                Container(
                  height: 260,
                  width: double.infinity,
                  child: Image.network(
                    meal.imageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    left: 20,
                    right: 20,
                    top: 200,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 124,
                      child: Card(
                        elevation: 4,
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, top: 14, bottom: 14),
                              child: Text(
                                meal.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal),
                              ),
                            ),
                            Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(
                                          Icons.access_time,
                                          size: 20,
                                          color: Color(0xffA9CA50),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          FontAwesomeIcons.hamburger,
                                          size: 20,
                                          color: Color(0xffA9CA50),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          child: FaIcon(
                                            FontAwesomeIcons.utensils,
                                            size: 20,
                                            color: Color(0xffA9CA50),
                                          ),
                                        ),
                                      ]),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      _buildText(
                                          context, "${meal.duration} min"),
                                      _buildText(context,
                                          "${meal.ingredients.length} ingredients"),
                                      _buildText(context,
                                          meal.getComplexity(meal.complexity)),
                                    ],
                                  )
                                ],
                              ),
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                            )
                          ],
                        ),
                      ),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0, bottom: 0),
              child: TabBar(
                tabs: [
                  Tab(
                    text: "Ingredients",
                  ),
                  Tab(
                    text: "Steps",
                  )
                ],
                unselectedLabelColor: Colors.grey,
                labelColor: Theme.of(context).primaryColor,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Theme.of(context).primaryColor,
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                ListView.builder(
                  padding: const EdgeInsets.only(top: 20),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(top: 8, left: 50.0),
                        child: CircleAvatar(
                          radius: 4.0,
                          backgroundColor: Color(0xffA9CA50),
                        ),
                      ),
                      title: Text(
                        meal.ingredients[index],
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Dash(
                        dashColor: Colors.grey,
                        dashLength: 5,
                        length: 250,
                        direction: Axis.horizontal,
                        dashGap: 10,
                        dashThickness: 1,
                      ),
                    );
                  },
                  itemCount: meal.ingredients.length,
                ),
                ListView.builder(
                  padding: const EdgeInsets.only(top: 20),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                        child: CircleAvatar(
                            backgroundColor: Color(0xffA9CA50),
                            radius: 15,
                            child: Text(
                              "${index + 1}",
                              style: Theme.of(context).textTheme.bodyText2.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            )),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          meal.steps[index],
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(fontSize: 16),
                        ),
                      ),
                    );
                  },
                  itemCount: meal.steps.length,
                )
              ]),
            ),
          ])),
    );
  }
}
