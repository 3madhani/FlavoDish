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
            recipe.label ?? "No title available", // Handle null title
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
            minutes: recipe.totalTime ?? 0, // Handle null total time
            dishType: recipe.dishType != null && recipe.dishType!.isNotEmpty
                ? recipe.dishType![0]
                : "No dish type available", // Handle null or empty dishType
            cuisineType: recipe.cuisineType != null &&
                    recipe.cuisineType!.isNotEmpty
                ? recipe.cuisineType![0]
                : "No cuisine type available", // Handle null or empty cuisineType
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
          ingredient: recipe.ingredients ?? [], // Handle null ingredients
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
          instructions:
              recipe.ingredientLines ?? [], // Handle null ingredient lines
        ),
      ],
    );
  }
}
