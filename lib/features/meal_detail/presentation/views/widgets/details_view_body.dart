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
          top: MediaQuery.of(context).size.height * 0.24,
          left: MediaQuery.of(context).size.width * 0.05,
          child: FavoriteIcon(
            recipe: recipe,
          ),
        ),
      ],
    );
  }
}
