import 'dart:async';
import 'package:flavodish/data/models/meal_model/recipe.dart';
import 'package:flavodish/features/meal_detail/data/repo/favorite_repo_impl.dart';
import 'favorite_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepositoryImpl favoritesRepository;

  FavoritesCubit(this.favoritesRepository) : super(FavoritesLoading()) {
    // Listen to the favorites stream
    favoritesRepository.favoritesStream.listen((favorites) {
      if (!isClosed) {
        emit(FavoritesLoaded(favorites));
      }
    });
  }

  Future<void> loadFavorites() async {
    emit(FavoritesLoading());
    final favorites = await favoritesRepository.getFavorites();
    if (!isClosed) {
      emit(FavoritesLoaded(favorites));
    }
  }

  Future<void> addFavorite(Recipe recipe) async {
    final currentFavorites = await favoritesRepository.getFavorites();
    if (!currentFavorites.any((fav) => fav.uri == recipe.uri)) {
      await favoritesRepository.addFavorite(recipe);
      final updatedFavorites = await favoritesRepository.getFavorites();
      if (!isClosed) {
        emit(FavoritesLoaded(updatedFavorites)); // Emit updated state
      }
    }
  }

  Future<void> removeFavorite(String uri) async {
    await favoritesRepository.removeFavorite(uri);
    final updatedFavorites = await favoritesRepository.getFavorites();
    if (!isClosed) {
      emit(FavoritesLoaded(updatedFavorites)); // Emit updated state
    }
  }
}
