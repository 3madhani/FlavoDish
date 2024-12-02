import 'package:cached_network_image/cached_network_image.dart';
import 'package:flavodish/constants.dart';
import 'package:flavodish/data/models/meal_model/recipe.dart';
import 'package:flavodish/features/meals/presentation/views/widgets/card_of_meals_body.dart';
import 'package:flutter/material.dart';

class SearchedMealCard extends StatelessWidget {
  const SearchedMealCard({
    super.key,
    required this.alignment,
    required this.searchedMeal,
  });
  final Alignment alignment;
  final Recipe searchedMeal;

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
            imageUrl: searchedMeal.image!,
            height: MediaQuery.sizeOf(context).height * 0.36,
            alignment: alignment,
            fit: BoxFit.cover,
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
          top: MediaQuery.sizeOf(context).height * 0.36,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: kScaffoldColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.greenAccent.withOpacity(0.4),
                  offset: const Offset(8, -20),
                  blurRadius: 24,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: CardOfMealsBody(
              recipe: searchedMeal,
            ),
          ),
        ),
      ],
    );
  }
}
