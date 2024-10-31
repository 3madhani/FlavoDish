import 'package:flavodish/constants.dart';
import 'package:flavodish/core/utils/styles.dart';
import 'package:flavodish/data/models/meal_model/recipe.dart';
import 'package:flutter/material.dart';

class CardOfMealsBody extends StatelessWidget {
  const CardOfMealsBody({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    // Get screen width
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
      child: SingleChildScrollView(
        // Wrap with SingleChildScrollView
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              overflow: TextOverflow.ellipsis,
              recipe.label ?? "No title available", // Handle null title
              style: Styles.textStyle18.copyWith(
                color: const Color.fromARGB(255, 79, 81, 84),
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.042, // Responsive font size
              ),
            ),
            SizedBox(height: screenWidth * 0.01), // Responsive spacing
            Text(
              overflow: TextOverflow.ellipsis,
              recipe.dishType != null && recipe.dishType!.isNotEmpty
                  ? recipe.dishType![0]
                  : "No dish type available",
              style: Styles.textStyle16.copyWith(
                color: const Color.fromARGB(255, 155, 159, 165),
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.038, // Responsive font size
              ),
            ),
            SizedBox(height: screenWidth * 0.01), // Responsive spacing
            Text(
              overflow: TextOverflow.ellipsis,
              recipe.cuisineType != null && recipe.cuisineType!.isNotEmpty
                  ? recipe.cuisineType![0]
                  : "No cuisine type available", // Handle null or empty cuisine type
              style: Styles.textStyle16.copyWith(
                color: const Color.fromARGB(255, 155, 159, 165),

                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.038, // Responsive font size
              ),
            ),
            SizedBox(height: screenWidth * 0.01), // Responsive spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    recipe.source ??
                        "No source available", // Handle null source
                    style: Styles.textStyle16.copyWith(
                      color: const Color.fromARGB(255, 155, 159, 165),

                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.038, // Responsive font size
                    ),
                  ),
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  "${recipe.totalTime ?? 0} min", // Handle null total time
                  style: Styles.textStyle16.copyWith(
                    color: const Color.fromARGB(255, 155, 159, 165),

                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.038, // Responsive font size
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
