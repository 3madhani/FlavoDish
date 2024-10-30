import 'package:flavodish/core/utils/styles.dart';
import 'package:flavodish/features/meals/presentation/views/widgets/card_of_meals.dart';
import 'package:flavodish/features/meal_detail/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:flavodish/features/meal_detail/presentation/manager/favorite_cubit/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfFavoriteMeals extends StatelessWidget {
  const ListOfFavoriteMeals({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FavoritesLoaded) {
          final favorites = state.recipes;

          if (favorites.isEmpty) {
            return const Center(
                child: Text(
              "No favorites added yet!",
              style: Styles.textStyle18,
            ));
          }

          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: CardOfMeals(recipe: favorites[index]),
              );
            },
          );
        } else if (state is FavoritesError) {
          return Center(
              child: Text("Failed to load favorites: ${state.message}"));
        }

        return const SizedBox.shrink();
      },
    );
  }
}
