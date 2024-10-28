import 'package:flavodish/data/models/meal_model/meal_model.dart';
import 'package:flutter/material.dart';

import 'custom_app_bar_meals_view.dart';
import 'list_of_meals.dart';

class MealsViewBody extends StatelessWidget {
  const MealsViewBody({
    super.key,
    required this.meal,
    required this.mealType, this.dishType,
  });
  final String? mealType;
  final String? dishType;
  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CustomAppBarMealsView(
              mealType: mealType,
              dishType: dishType,
            ),
          ),
          SliverFillRemaining(
            child: ListOfMeals(
              meal: meal,
            ),
          )
        ],
      ),
    );
  }
}
