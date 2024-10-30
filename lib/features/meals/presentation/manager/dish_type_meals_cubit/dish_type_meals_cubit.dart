import 'package:equatable/equatable.dart';
import 'package:flavodish/data/models/meal_model/meal_model.dart';
import 'package:flavodish/features/meals/data/repo/meals_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dish_type_meals_state.dart';

class DishTypeMealsCubit extends Cubit<DishTypeMealsState> {
  DishTypeMealsCubit(this.mealsRepo) : super(DishTypeMealsInitial());

  final MealsRepo mealsRepo;

  Future<void> getMealsDependingOnDishType({required String dishType, String? cuisineType}) async {
  emit(DishTypeMealsLoading());
    var result = await mealsRepo.getMealsDependingOnDishType(
      dishType: dishType,
      cuisineType: cuisineType,
    );

    result.fold((failure) {
      emit(
        DishTypeMealsFailure(
          errMessage: failure.errMessage,
        ),
      );
    }, (meal) {
      emit(
        DishTypeMealsSuccess(
          meal: meal,
        ),
      );
    });
  }
}
