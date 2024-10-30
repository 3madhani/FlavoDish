import 'dart:async';
import 'package:flavodish/data/models/meal_model/recipe.dart';
import 'favorite_repo.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final List<Recipe> _favorites = []; // Local storage for favorites
  final StreamController<List<Recipe>> _favoritesController =
      StreamController<List<Recipe>>.broadcast();

  FavoritesRepositoryImpl() {
    // Initially populate the stream with current favorites
    _favoritesController.add(List.from(_favorites));
  }

  @override
  Stream<List<Recipe>> get favoritesStream => _favoritesController.stream;

  @override
Future<void> addFavorite(Recipe recipe) async {
  if (!_favorites.any((fav) => fav.uri == recipe.uri)) {
    _favorites.add(recipe);
    _favoritesController.add(List.from(_favorites)); // Emit the updated list
  }
}

@override
Future<void> removeFavorite(String uri) async {
  _favorites.removeWhere((recipe) => recipe.uri == uri);
  _favoritesController.add(List.from(_favorites)); // Emit the updated list
}


  @override
  Future<List<Recipe>> getFavorites() async {
    return List.from(_favorites); // Return current favorites as a new list
  }

  void dispose() {
    _favoritesController.close(); // Close the stream controller
  }
}
