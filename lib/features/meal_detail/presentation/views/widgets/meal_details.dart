import 'package:flavodish/constants.dart';
import 'package:flavodish/data/models/meal_model/recipe.dart';
import 'package:flutter/material.dart';
import 'meal_details_view_body.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({
    super.key,
    required this.recipe,
  });
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kScaffoldColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            offset: const Offset(8, -20),
            blurRadius: 24,
            spreadRadius: 3,
          ),
        ],
      ),
      child: MealDetailsViewBody(
        recipe: recipe,
      ),
    );
  }
}
