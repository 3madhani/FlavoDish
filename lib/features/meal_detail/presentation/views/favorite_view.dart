import 'package:flavodish/core/utils/service_locator.dart';
import 'package:flavodish/features/meal_detail/data/repo/favorite_repo_impl.dart';
import 'package:flavodish/features/meal_detail/presentation/manager/favorite_cubit/favorite_cubit.dart';
import 'package:flavodish/features/meal_detail/presentation/manager/favorite_cubit/favorite_state.dart';
import 'package:flavodish/features/meal_detail/presentation/views/widgets/animated_text.dart';
import 'package:flavodish/features/meal_detail/presentation/views/widgets/list_of_favorite_meals.dart'; // Updated import
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteRecipeView extends StatelessWidget {
  const FavoriteRecipeView({super.key});

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      titleSpacing: 2,
      shadowColor: Colors.blueAccent.withOpacity(0.1),
      title: const AnimatedText(
        text: "Favorite Recipes",
      ),
      centerTitle: true,
    );

    return BlocProvider(
      create: (context) =>
          FavoritesCubit(getIt.get<FavoritesRepositoryImpl>())..loadFavorites(),
      child: Scaffold(
        appBar: appBar,
        body: BlocListener<FavoritesCubit, FavoritesState>(
          listener: (context, state) {
            if (state is FavoritesUpdated) {
              // Show a message on favorites update
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Favorites updated!')),
              );
            }
          },
          child:
              const ListOfFavoriteMeals(), // Updated to use ListOfFavoriteMeals
        ),
      ),
    );
  }
}
