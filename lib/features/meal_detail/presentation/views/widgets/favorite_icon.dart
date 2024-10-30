import 'package:flavodish/constants.dart';
import 'package:flavodish/data/models/meal_model/recipe.dart';
import 'package:flavodish/features/meal_detail/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:flavodish/features/meal_detail/presentation/manager/favorite_cubit/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class FavoriteIcon extends StatelessWidget {
  final Recipe recipe;

  const FavoriteIcon({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        // Check if the recipe is in the favorites list
        final isFavorite = state is FavoritesLoaded &&
            state.recipes.any((fav) => fav.uri == recipe.uri);

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Container(
            key: ValueKey<bool>(isFavorite),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kScaffoldColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.redAccent.withOpacity(0.6),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: IconButton(
              key: ValueKey<bool>(isFavorite),
              icon: Icon(
                isFavorite ? Iconsax.heart5 : Iconsax.heart5,
                size: 35,
              ),
              color: isFavorite ? Colors.red : null, // Color red if favorited
              tooltip:
                  isFavorite ? 'Remove from favorites' : 'Add to favorites',
              onPressed: () {
                if (isFavorite) {
                  context.read<FavoritesCubit>().removeFavorite(recipe.uri!);
                  // Show a message on favorites update
                  ScaffoldMessenger.of(context).showSnackBar(
                    snackBarAnimationStyle: AnimationStyle(
                      curve: Curves.easeInOutCubicEmphasized,
                      duration: const Duration(milliseconds: 100),
                    ),
                    const SnackBar(content: Text('Removed from favorites!')),
                  );
                } else {
                  context.read<FavoritesCubit>().addFavorite(recipe);
                  // Show a message on favorites update
                  ScaffoldMessenger.of(context).showSnackBar(
                    snackBarAnimationStyle: AnimationStyle(
                      curve: Curves.easeInOutCubicEmphasized,
                      duration: const Duration(milliseconds: 100),
                    ),
                    const SnackBar(content: Text('Added to favorites!')),
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
