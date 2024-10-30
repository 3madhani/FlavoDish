import 'package:flavodish/core/utils/styles.dart';
import 'package:flavodish/data/models/meal_model/recipe.dart';
import 'package:flutter/material.dart';

class CardOfMealsBody extends StatelessWidget {
  const CardOfMealsBody({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            overflow: TextOverflow.ellipsis,
            recipe.label ?? "No title available", // Handle null title
            style: Styles.textStyle18.copyWith(
              color: Colors.black,
            ),
          ),
          Text(
            overflow: TextOverflow.ellipsis,
            recipe.dishType != null && recipe.dishType!.isNotEmpty
                ? recipe.dishType![0]
                : "No dish type available",
            style: Styles.textStyle16.copyWith(
              color: Colors.black,
            ),
          ),
          Text(
            overflow: TextOverflow.ellipsis,
            recipe.cuisineType != null && recipe.cuisineType!.isNotEmpty
                ? recipe.cuisineType![0]
                : "No cuisine type available", // Handle null or empty cuisine type
            style: Styles.textStyle16.copyWith(
              color: Colors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  recipe.source ?? "No source available", // Handle null source
                  style: Styles.textStyle16.copyWith(
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                overflow: TextOverflow.ellipsis,
                "${recipe.totalTime ?? 0} min", // Handle null total time
                style: Styles.textStyle16.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
