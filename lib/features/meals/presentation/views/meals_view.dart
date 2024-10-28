import 'package:flavodish/core/utils/service_locator.dart';
import 'package:flavodish/core/utils/widgets/custom_error_widget.dart';
import 'package:flavodish/core/utils/widgets/custom_loading_indicator.dart';
import 'package:flavodish/features/meals/data/repo/meals_repo_impl.dart';
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
    return Scaffold(
      body: dishType == null
          ? BlocProvider(
              create: (context) =>
                  MealTypeMealsCubit(getIt.get<MealsRepoImpl>())
                    ..getMealsDependingOnMealType(
                      mealType: mealType!,
                    ),
              child: BlocBuilder<MealTypeMealsCubit, MealTypeMealsState>(
                builder: (context, state) {
                  
                  if (state is MealTypeMealsSuccess && state.meal.hits!.isNotEmpty) {
                    return MealsViewBody(
                      mealType: mealType,
                      dishType: dishType,
                      meal: state.meal,
                    );
                  } else if (state is MealTypeMealsFailure) {
                    print(state.errMessage);
                    return CustomErrorWidget(errorMessage: state.errMessage);

                  } else {
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: ShimmerMealsItem());
                        });
                  }
                },
              ),
            )
          : BlocProvider(
              create: (context) =>
                  DishTypeMealsCubit(getIt.get<MealsRepoImpl>())
                    ..getMealsDependingOnDishType(
                      dishType: dishType!,
                    ),
              child: BlocBuilder<DishTypeMealsCubit, DishTypeMealsState>(
                builder: (context, state) {
                  if (state is DishTypeMealsSuccess) {
                    return MealsViewBody(
                      mealType: mealType,
                      dishType: dishType,
                      meal: state.meal,
                    );
                  } else if (state is DishTypeMealsFailure) {
                    return CustomErrorWidget(errorMessage: state.errMessage);
                  } else {
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return const Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: ShimmerMealsItem());
                        });
                  }
                },
              ),
            ),
    );
  }
}
