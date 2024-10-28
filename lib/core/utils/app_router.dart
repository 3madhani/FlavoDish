import 'package:flavodish/core/utils/service_locator.dart';
import 'package:flavodish/features/home/presentation/views/home_view.dart';
import 'package:flavodish/features/main/presentation/views/main_view.dart';
import 'package:flavodish/features/meals/data/repo/meals_repo_impl.dart';
import 'package:flavodish/features/meals/presentation/manager/dish_cuisine_type-meals_cubit/dish_cuisine_type_meals_cubit.dart';
import 'package:flavodish/features/meals/presentation/manager/dish_type_meals_cubit/dish_type_meals_cubit.dart';
import 'package:flavodish/features/meals/presentation/manager/meal_type_meals_cubit/meal_type_meals_cubit.dart';
import 'package:flavodish/features/meals/presentation/views/meals_view.dart';
import 'package:flavodish/features/profile/presentation/views/profile_view.dart';
import 'package:flavodish/features/savedRecipes/presentation/views/saved_recipes_view.dart';
import 'package:flavodish/features/search/data/repo/search_repo_impl.dart';
import 'package:flavodish/features/search/presentation/manager/searched_meals_cubit/searched_meals_cubit.dart';
import 'package:flavodish/features/search/presentation/views/search_view.dart';
import 'package:flavodish/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String splashRoute = '/';
  static const String mainRoute = '/mainView';
  static const String homeRoute = '/homeView';
  static const String searchRoute = '/searchView';
  static const String savedRecipesRoute = '/savedRecipesView';
  static const String profileRoute = '/profileView';
  static const String mealDetailsRoute = '/mealDetailsView';
  static const String mealRoute = '/mealView';

  static final router = GoRouter(
    initialLocation: mainRoute,
    routes: <RouteBase>[
      GoRoute(
        path: splashRoute,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: mainRoute,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1500),
              child: const MainView(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                // Define the zoom transition
                return ScaleTransition(
                  scale: animation.drive(
                    CurveTween(
                      curve: Curves.easeInOut,
                    ),
                  ),
                  child: child,
                );
              });
        }, // Main view with bottom navigation
      ),
      GoRoute(
        path: homeRoute,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: searchRoute,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchedMealsCubit(
            getIt.get<SearchRepoImpl>(),
          ),
          child: const SearchView(),
        ),
      ),
      GoRoute(
        path: savedRecipesRoute,
        builder: (context, state) => const SavedRecipesView(),
      ),
      GoRoute(
        path: profileRoute,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: searchRoute,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => MealTypeMealsCubit(
                getIt.get<MealsRepoImpl>(),
              ),
            ),
            BlocProvider(
              create: (context) => DishTypeMealsCubit(
                getIt.get<MealsRepoImpl>(),
              ),
            ),
            BlocProvider(
              create: (context) => DishCuisineTypeMealsCubit(
                getIt.get<MealsRepoImpl>(),
              ),
            ),
          ],
          child: const MealsView(),
        ),
      ),
      // GoRoute(
      //   path: bookDetailsRoute,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => SimilarBooksCubit(
      //       getIt.get<HomeRepoImpl>(),
      //     ),
      //     child: BookDetailsView(
      //       bookModel: state.extra as BookModel,
      //     ),
      //   ),
      // ),
      // GoRoute(
      //   path: searchRoute,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => SearchedBooksCubit(
      //       getIt.get<SearchRepoImpl>(),
      //     ),
      //     child: const SearchView(),
      //   ),
      // ),
    ],
  );
}
