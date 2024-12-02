import 'package:flavodish/data/models/meal_model/recipe.dart';

abstract class FavoritesState {}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<Recipe> recipes;
  FavoritesLoaded(this.recipes);
}

class FavoritesError extends FavoritesState {
  final String message;
  FavoritesError(this.message);
}

// Update FavoritesUpdated to optionally hold a recipe
class FavoritesUpdated extends FavoritesState {
  final Recipe? updatedRecipe;

  FavoritesUpdated({this.updatedRecipe});
}
