import 'package:flutter/material.dart';

import 'list_of_favorite_meals.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: true,
            child: ListOfFavoriteMeals(),
          ),
        ],
      ),
    );
  }
}