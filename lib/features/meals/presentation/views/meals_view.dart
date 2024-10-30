import 'package:flavodish/core/utils/service_locator.dart';
import 'package:flavodish/features/meals/data/repo/meals_repo_impl.dart';
import 'package:flavodish/features/meals/presentation/manager/dish_cuisine_type-meals_cubit/dish_cuisine_type_meals_cubit.dart';
import 'package:flavodish/features/meals/presentation/manager/dish_type_meals_cubit/dish_type_meals_cubit.dart';
import 'package:flavodish/features/meals/presentation/manager/meal_type_meals_cubit/meal_type_meals_cubit.dart';
import 'package:flavodish/features/meals/presentation/views/widgets/meals_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealsView extends StatelessWidget {
  const MealsView({
    super.key,
    this.mealType,
    this.dishType,
  });
  final String? mealType;
  final String? dishType;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MealTypeMealsCubit(getIt.get<MealsRepoImpl>())
            ..getMealsDependingOnMealType(
              mealType: mealType!,
            ),
        ),
        BlocProvider(
          create: (context) => DishTypeMealsCubit(getIt.get<MealsRepoImpl>())
            ..getMealsDependingOnDishType(
              dishType: dishType!,
            ),
        ),
        BlocProvider(
          create: (context) => DishCuisineTypeMealsCubit(
            getIt.get<MealsRepoImpl>(),
          ),
        ),
      ],
      child: Scaffold(
        body: MealsViewBody(
          mealType: mealType,
          dishType: dishType,
        ),
      ),
    );
  }
}
