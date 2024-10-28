import 'package:cached_network_image/cached_network_image.dart';
import 'package:flavodish/constants.dart';
import 'package:flavodish/core/utils/styles.dart';
import 'package:flavodish/data/models/meal_model/recipe.dart';
import 'package:flutter/material.dart';

class SearchedMealCard extends StatelessWidget {
  const SearchedMealCard({
    super.key,
    required this.alignment,
    required this.meal,
  });
  final Alignment alignment;
  final Recipe meal;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          child: CachedNetworkImage(
            imageUrl: meal.image!,
            height: MediaQuery.sizeOf(context).height * 0.4,
            alignment: alignment,
            fit: BoxFit.none,
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              size: 60,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          top: MediaQuery.sizeOf(context).height * 0.375,
          child: Container(
            alignment: Alignment.center,
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
                ]),
            child: const Text(
              "MealName",
              style: Styles.textStyle20,
            ),
          ),
        ),
      ],
    );
  }
}
