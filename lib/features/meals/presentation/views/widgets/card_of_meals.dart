import 'package:cached_network_image/cached_network_image.dart';
import 'package:flavodish/constants.dart';
import 'package:flavodish/core/utils/widgets/animated_open_container.dart';
import 'package:flavodish/data/models/meal_model/recipe.dart';
import 'package:flavodish/features/mealsView/presentation/views/meal_details_view.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import 'card_of_meals_body.dart';

class CardOfMeals extends StatelessWidget {
  const CardOfMeals({
    super.key,
    required this.recipe,
  });
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.19,
      child: Stack(
        children: [
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 5),
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
              )),
          Positioned(
            left: 20,
            top: 25,
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.5,
              height: MediaQuery.sizeOf(context).height * 0.14,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
                color: kScaffoldColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 5),
                  )
                ],
              ),
              child: AnimatedOpenContainer(
                openedWidget: DetailsView(
                  meal: recipe,
                ),
                borderRadius: 24,
                closedWidget: CardOfMealsBody(
                  recipe: recipe,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
