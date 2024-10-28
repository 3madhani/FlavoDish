import 'package:flavodish/core/utils/styles.dart';
import 'package:flavodish/data/models/meal_model/recipe.dart';
import 'package:flutter/material.dart';

import 'ingredients_list_view.dart';
import 'meal_dish_and_cuisine.dart';
import 'recipe_instruction_list_view.dart';

class MealDetailsViewBody extends StatelessWidget {
  const MealDetailsViewBody({
    super.key,
    required this.recipe,
  });
  final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            recipe.label!,
            style: Styles.textStyle20.copyWith(
              fontWeight: FontWeight.normal,
              wordSpacing: 2,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: MealDishAndCuisine(
            minutes: recipe.totalTime!,
            dishType: recipe.dishType![0],
            cuisineType: recipe.cuisineType![0],
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'INGREDIENTS',
              style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.normal,
                wordSpacing: 2,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
        IngredientsListView(
          ingredient: recipe.ingredients!,
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'RECIPE INSTRUCTIONS',
              style: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.normal,
                  wordSpacing: 2,
                  letterSpacing: 1.5),
            ),
          ),
        ),
        const SizedBox(height: 10),
        RecipeInstructionsListView(
          instructions: recipe.ingredientLines!,
        ),
      ],
    );
  }
}
