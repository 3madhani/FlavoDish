import 'package:flavodish/features/authentication/presentation/views/forget_password_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flavodish/features/authentication/presentation/views/auth_view.dart';
import 'package:flavodish/features/home/presentation/views/home_view.dart';
import 'package:flavodish/features/main/presentation/views/main_view.dart';
import 'package:flavodish/features/meal_detail/presentation/views/favorite_view.dart';
import 'package:flavodish/features/profile/presentation/views/profile_view.dart';
import 'package:flavodish/features/search/presentation/views/search_view.dart';
import 'package:flavodish/features/splash/presentation/views/splash_view.dart';

class AppRouter {
  final bool isLogin;
  late final GoRouter router;

  static const String authRoute = '/authView';
  static const String splashRoute = '/';
  static const String mainRoute = '/mainView';
  static const String homeRoute = '/homeView';
  static const String searchRoute = '/searchView';
  static const String savedRecipesRoute = '/savedRecipesView';
  static const String profileRoute = '/profileView';
  static const String mealDetailsRoute = '/mealDetailsView';
  static const String mealRoute = '/mealView';

  static const String forgetPasswordRoute = '/forgetPasswordView';

  AppRouter({required this.isLogin}) {
    router = GoRouter(
      initialLocation: isLogin ? AppRouter.mainRoute : AppRouter.splashRoute,
      routes: <RouteBase>[
        GoRoute(
          path: AppRouter.authRoute,
          builder: (context, state) => const AuthView(),
        ),
        GoRoute(
          path: AppRouter.forgetPasswordRoute,
          builder: (context, state) => const ForgetPasswordView(),
        ),
        GoRoute(
          path: AppRouter.splashRoute,
          builder: (context, state) => const SplashView(),
        ),
        GoRoute(
          path: AppRouter.mainRoute,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 1500),
              child: const MainView(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation.drive(
                    CurveTween(curve: Curves.easeInOut),
                  ),
                  child: SlideTransition(
                    position: animation.drive(
                      Tween<Offset>(
                        begin: const Offset(0.1, 0),
                        end: Offset.zero,
                      ).chain(CurveTween(curve: Curves.easeInOut)),
                    ),
                    child: child,
                  ),
                );
              },
            );
          },
        ),
        GoRoute(
          path: AppRouter.homeRoute,
          builder: (context, state) => const HomeView(),
        ),
        GoRoute(
          path: AppRouter.searchRoute,
          builder: (context, state) => const SearchView(),
        ),
        GoRoute(
          path: AppRouter.savedRecipesRoute,
          builder: (context, state) => const FavoriteRecipeView(),
        ),
        GoRoute(
          path: AppRouter.profileRoute,
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

  
}
