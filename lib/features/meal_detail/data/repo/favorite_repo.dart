import 'package:flavodish/data/models/meal_model/recipe.dart';

abstract class FavoritesRepository {
  Stream<List<Recipe>> get favoritesStream;
  Future<void> addFavorite(Recipe recipe);
  Future<void> removeFavorite(String uri);
  Future<List<Recipe>> getFavorites();
}
