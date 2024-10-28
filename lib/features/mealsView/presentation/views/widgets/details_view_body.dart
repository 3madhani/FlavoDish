import 'package:flavodish/data/models/meal_model/recipe.dart';
import 'package:flavodish/features/mealsView/presentation/views/widgets/sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'favorite_button.dart';
import 'meal_details.dart';
import 'meal_image.dart';

class DetailsViewBody extends StatefulWidget {
  const DetailsViewBody({super.key, required this.recipe});

  final Recipe recipe;

  @override
  State<DetailsViewBody> createState() => _DetailsViewBodyState();
}

class _DetailsViewBodyState extends State<DetailsViewBody> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MealImage(
          mealImage: widget.recipe.image!,
        ),
        Positioned(
          top: MediaQuery.sizeOf(context).height * 0.24,
          left:
              MediaQuery.sizeOf(context).width * 0.05, // Position to the right
          child: FavoriteIcon(
            isFavorite: isFavorite,
            onFavoriteToggle: (value) {
              setState(() {
                isFavorite = value;
              });
            },
          ),
        ),
        CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            const ButtonSliverAppBar(),
            SliverFillRemaining(
              hasScrollBody: true,
              child: MealDetails(
                recipe: widget.recipe,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
