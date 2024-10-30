import 'package:cached_network_image/cached_network_image.dart';
import 'package:flavodish/constants.dart';
import 'package:flavodish/data/models/meal_model/ingredient.dart';
import 'package:flavodish/core/utils/styles.dart';
import 'package:flutter/material.dart';

class IngredientsListView extends StatelessWidget {
  const IngredientsListView({
    super.key,
    required this.ingredient,
  });

  final List<Ingredient> ingredient;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.2,
      child: ListView.builder(
        itemCount: ingredient.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) {
          final currentIngredient = ingredient[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.24,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: kPrimaryTextColor,
                      width: 1,
                    ),
                  ),
                  child: ClipOval(
                    child: CachedNetworkImage(
                      width: MediaQuery.sizeOf(context).width * 0.2,
                      height: MediaQuery.sizeOf(context).width * 0.2,

                      imageUrl: currentIngredient.image ??
                          '', // Using null-aware operator
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        size: 60,
                      ),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(), // Optional loading indicator
                      fit: BoxFit.cover, // Ensure the image covers the circle
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.2,
                  child: Text(
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    currentIngredient.text ??
                        "No ingredient text available", // Fallback text
                    style: Styles.textStyle16.copyWith(
                      height: 1.2,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
