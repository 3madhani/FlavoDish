import 'package:flutter/material.dart';

import 'custom_app_bar_meals_view.dart';
import 'list_of_meals.dart';

class MealsViewBody extends StatelessWidget {
  const MealsViewBody({
    super.key,
    required this.mealType,
    this.dishType,
  });
  final String? mealType;
  final String? dishType;

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
              mealType: mealType,
              dishType: dishType,
            ),
          ),
        ],
      ),
    );
  }
}
