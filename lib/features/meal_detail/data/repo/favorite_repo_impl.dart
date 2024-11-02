import 'dart:async';
import 'dart:convert'; // For JSON encoding and decoding
import 'package:flavodish/data/models/meal_model/recipe.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'favorite_repo.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  final Box<String> _favoritesBox = Hive.box<String>('favorites'); // Opened Hive box

  final StreamController<List<Recipe>> _favoritesController =
      StreamController<List<Recipe>>.broadcast();

  FavoritesRepositoryImpl() {
    // Load existing favorites from Hive
    _favoritesController.add(_getFavoritesFromHive());
  }

  List<Recipe> _getFavoritesFromHive() {
    return _favoritesBox.values
        .map((jsonString) => Recipe.fromJson(json.decode(jsonString)))
        .toList();
  }

  @override
  Stream<List<Recipe>> get favoritesStream => _favoritesController.stream;

  @override
  Future<void> addFavorite(Recipe recipe) async {
    if (!_favoritesBox.containsKey(recipe.uri)) {
      await _favoritesBox.put(recipe.uri!, json.encode(recipe.toJson())); // Save to Hive
      _favoritesController.add(_getFavoritesFromHive()); // Emit updated list
    }
  }

  @override
  Future<void> removeFavorite(String uri) async {
    await _favoritesBox.delete(uri);
    _favoritesController.add(_getFavoritesFromHive()); // Emit updated list
  }

  @override
  Future<List<Recipe>> getFavorites() async {
    return _getFavoritesFromHive(); // Return Hive-stored favorites
  }

  void dispose() {
    _favoritesController.close();
  }
}
