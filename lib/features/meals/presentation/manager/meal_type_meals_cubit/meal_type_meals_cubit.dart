import 'package:equatable/equatable.dart';
import 'package:flavodish/data/models/meal_model/meal_model.dart';
import 'package:flavodish/features/meals/data/repo/meals_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'meal_type_meals_state.dart';

class MealTypeMealsCubit extends Cubit<MealTypeMealsState> {
  MealTypeMealsCubit(this.mealsRepo) : super(MealTypeMealsInitial());

  final MealsRepo mealsRepo;


  Future<void> getMealsDependingOnMealType({required String mealType}) async {
    emit(MealTypeMealsLoading());
    var result = await mealsRepo.getMealsDependingOnMealType(
      mealType: mealType,
    );

    result.fold((failure) {
      emit(
        MealTypeMealsFailure(
          errMessage: failure.errMessage,
        ),
      );
    }, (meal) {
      emit(
        MealTypeMealsSuccess(
          meal: meal,
        ),
      );
    });
  }
}
