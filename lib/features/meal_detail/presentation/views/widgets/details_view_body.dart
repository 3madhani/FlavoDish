import 'package:flavodish/data/models/meal_model/recipe.dart';
import 'package:flutter/material.dart';
import 'favorite_icon.dart';
import 'meal_image.dart';
import 'meal_details.dart';
import 'sliver_app_bar.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context); // Use MediaQuery once

    return Stack(
      children: [
        MealImage(mealImage: recipe.image!),
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const ButtonSliverAppBar(),
            SliverFillRemaining(
              hasScrollBody: true,
              child: MealDetails(recipe: recipe),
            ),
          ],
        ),
        Positioned(
          top: screenSize.height *
              0.3, // Adjust top position based on screen height
          left: screenSize.width *
              0.05, // Adjust left position based on screen width
          child: FavoriteIcon(recipe: recipe),
        ),
      ],
    );
  }
}
