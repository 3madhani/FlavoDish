import 'package:cached_network_image/cached_network_image.dart';
import 'package:flavodish/core/utils/widgets/animated_open_container.dart';
import 'package:flavodish/data/models/meal_model/recipe.dart';
import 'package:flavodish/features/meal_detail/presentation/views/details_view.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import 'vibrate_card.dart';

class CardOfMeals extends StatelessWidget {
  const CardOfMeals({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    // Get screen height and width
    final screenHeight = MediaQuery.sizeOf(context).height;

    return SizedBox(
      height:
          screenHeight * 0.23, // Height can be adjusted based on requirements
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: AnimatedOpenContainer(
                openedWidget: DetailsView(
                  meal: recipe,
                ),
                closedWidget: AspectRatio(
                  aspectRatio: 7 / 6,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      bottomLeft: Radius.circular(24),
                    ),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: recipe.image!,
                      errorWidget: (context, url, error) => const Icon(
                        HugeIcons.strokeRoundedRssError,
                        size: 60,
                      ),
                    ),
                  ),
                ),
                borderRadius: 24,
              ),
            ),
          ),
          // Directly include VibrationCard without using Positioned
          VibrationCard(
              recipe:
                  recipe), // Assuming VibrationCard does not require additional layout
        ],
      ),
    );
  }
}
