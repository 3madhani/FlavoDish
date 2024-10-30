import 'package:flavodish/features/home/presentation/views/home_view.dart';
import 'package:flavodish/features/main/presentation/views/main_view.dart';
import 'package:flavodish/features/profile/presentation/views/profile_view.dart';
import 'package:flavodish/features/meal_detail/presentation/views/favorite_view.dart';
import 'package:flavodish/features/search/presentation/views/search_view.dart';
import 'package:flavodish/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
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
    initialLocation: splashRoute,
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
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: savedRecipesRoute,
        builder: (context, state) => const FavoriteRecipeView(),
      ),
      GoRoute(
        path: profileRoute,
        builder: (context, state) => const ProfileView(),
      ),
    ],
    errorBuilder: (context, state) {
      return Scaffold(
        body: Center(
          child: Text('Error: ${state.error}'),
        ),
      );
    },
  );
}
