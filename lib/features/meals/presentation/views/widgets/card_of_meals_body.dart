import 'package:flavodish/core/utils/styles.dart';
import 'package:flavodish/data/models/meal_model/recipe.dart';
import 'package:flutter/material.dart';

class CardOfMealsBody extends StatelessWidget {
  const CardOfMealsBody({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return  Padding(
                  padding: const EdgeInsets.all(
                    16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        recipe.label!,
                        style: Styles.textStyle16.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        recipe.dishType![0],
                        style: Styles.textStyle14.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        recipe.cuisineType![0],
                        style: Styles.textStyle14.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            overflow: TextOverflow.ellipsis,
                            recipe.source!,
                            style: Styles.textStyle14.copyWith(
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            "${recipe.totalTime!} min",
                            style: Styles.textStyle14.copyWith(
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