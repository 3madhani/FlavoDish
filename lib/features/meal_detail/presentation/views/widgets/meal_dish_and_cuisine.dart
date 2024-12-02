import 'package:flavodish/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class MealDishAndCuisine extends StatelessWidget {
  const MealDishAndCuisine({
    super.key,
    required this.minutes,
    required this.dishType,
    required this.cuisineType,
  });

  final int minutes;
  final String dishType;
  final String cuisineType;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Column for the icon and time
        Column(
          mainAxisSize: MainAxisSize.min, // Use min size to avoid stretching
          children: [
            const Icon(
              size: 40,
              HugeIcons.strokeRoundedClock05, // Adjust as necessary
            ),
            Text(
              "$minutes minutes",
              style: Styles.textStyle14,
            ),
          ],
        ),
        const SizedBox(width: 16), // Add some spacing between elements
        Flexible(
          child: Text(
            dishType.toUpperCase(),
            style: Styles.textStyle18,
            textAlign: TextAlign.center, // Center the text
            overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
          ),
        ),
        const SizedBox(width: 16), // Add some spacing between elements
        // Flexible for "Cuisine Type" to allow wrapping
        Flexible(
          child: Text(
            cuisineType.toUpperCase(),
            style: Styles.textStyle18,
            textAlign: TextAlign.center, // Center the text
            overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
          ),
        ),
      ],
    );
  }
}
