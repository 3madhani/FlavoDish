import 'package:equatable/equatable.dart';
import 'package:flavodish/data/models/meal_model/meal_model.dart';
import 'package:flavodish/features/meals/data/repo/meals_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dish_cuisine_type_meals_state.dart';

class DishCuisineTypeMealsCubit extends Cubit<DishCuisineTypeMealsState> {
  DishCuisineTypeMealsCubit(this.mealsRepo)
      : super(DishCuisineTypeMealsInitial());

  final MealsRepo mealsRepo;

  Future<void> getMealsDependingOnCuisineType(
      {required String cuisineType, final String? dishType, String? mealType}) async {
    emit(DishCuisineTypeMealsLoading());
    var result = await mealsRepo.getMealsDependingOnDishTypeAndCuisineType(
      dishType: dishType,
      cuisineType: cuisineType,
      mealType: mealType,
    );

    result.fold((failure) {
      emit(
        DishCuisineTypeMealsFailure(
          errMessage: failure.errMessage,
        ),
      );
    }, (meal) {
      emit(
        DishCuisineTypeMealsSuccess(
          meal: meal,
        ),
      );
    });
  }
}
