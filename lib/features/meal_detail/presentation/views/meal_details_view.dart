import 'package:flavodish/core/utils/service_locator.dart';
import 'package:flavodish/data/models/meal_model/recipe.dart';
import 'package:flavodish/features/meal_detail/data/repo/favorite_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/favorite_cubit/favorite_cubit.dart';
import 'widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({
    super.key,
    required this.meal,
  });

  final Recipe meal;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<FavoritesCubit>(
            create: (context) =>
                FavoritesCubit(getIt.get<FavoritesRepositoryImpl>())
                  ..loadFavorites(),
          ),

          // Add other providers here if needed
        ],
        child: Scaffold(
          body: DetailsViewBody(
            recipe: meal,
          ),
        ));
  }
}
