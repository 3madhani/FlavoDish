import 'package:flavodish/core/utils/widgets/custom_error_widget.dart';
import 'package:flavodish/core/utils/widgets/custom_loading_widget.dart';
import 'package:flavodish/features/meals/presentation/manager/dish_type_meals_cubit/dish_type_meals_cubit.dart';
import 'package:flavodish/features/meals/presentation/manager/meal_type_meals_cubit/meal_type_meals_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_of_meal_body.dart';

class ListOfMeals extends StatelessWidget {
  const ListOfMeals({
    super.key,
    required this.mealType,
    required this.dishType,
  });

  final String? mealType;
  final String? dishType;

  @override
  Widget build(BuildContext context) {
    return dishType == null
        ? BlocBuilder<MealTypeMealsCubit, MealTypeMealsState>(
            builder: (context, state) {
              if (state is MealTypeMealsSuccess &&
                  state.meal.hits!.isNotEmpty) {
                return ListOfMealsBody(
                  meal: state.meal,
                );
              } else if (state is MealTypeMealsFailure) {
                return CustomErrorWidget(errorMessage: state.errMessage);
              } else {
                return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: ShimmerMealsItem(
                          height: MediaQuery.sizeOf(context).height * 0.19,
                        ),
                      );
                    });
              }
            },
          )
        : BlocBuilder<DishTypeMealsCubit, DishTypeMealsState>(
            builder: (context, state) {
              if (state is DishTypeMealsSuccess) {
                return ListOfMealsBody(
                  meal: state.meal,
                );
              } else if (state is DishTypeMealsFailure) {
                return CustomErrorWidget(errorMessage: state.errMessage);
              } else {
                return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: ShimmerMealsItem(
                          height: MediaQuery.sizeOf(context).height * 0.19,
                        ),
                      );
                    });
              }
            },
          );
  }
}
