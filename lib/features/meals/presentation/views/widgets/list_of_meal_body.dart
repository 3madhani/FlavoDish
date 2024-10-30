import 'package:flavodish/constants.dart';
import 'package:flavodish/data/models/meal_model/meal_model.dart';
import 'package:flutter/material.dart';

import 'card_of_meals.dart';

class ListOfMealsBody extends StatelessWidget {
  const ListOfMealsBody({
    super.key,
    required this.meal,
  });

  final MealModel meal;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: meal.hits!.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(
          right: kPadding,
          bottom: 8,
          top: 8,
        ),
        child: CardOfMeals(
          recipe: meal.hits![index].recipe!,
        ),
      ),
    );
  }
}
