import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mvvm/models/movie_model.dart';
import 'package:movie_mvvm/view_model/favorites_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

final favoritesProvider = StateNotifierProvider<FavoritesProvider,FavoritesState>((ref) {
  return FavoritesProvider();
});

class FavoritesProvider extends StateNotifier<FavoritesState>{
  FavoritesProvider(): super(FavoritesState());

  final favsKey = 'favsKey';
  bool isFavorite(MovieModel movieModel){
    return state.favoritesList.any((movie)=> movie.id == movieModel.id);
  }

  Future<void> addOrRemoveFromFavorites(MovieModel movieModel)async{
    bool wasFavorite = isFavorite(movieModel);
    List<MovieModel> updatedFavorites = wasFavorite
    ? state.favoritesList.where(
      (element) => element.id != movieModel.id,
    ).toList()
    : [...state.favoritesList,movieModel];

    state = state.copyWith(favoritesList: updatedFavorites);
    await saveFavorites();
  }

  Future<void> saveFavorites()async{
    final prefs = await SharedPreferences.getInstance();
    final stringList = state.favoritesList.map((movie) => json.encode(movie.toJson())).toList();
    prefs.setStringList(favsKey, stringList);
  }

  Future<void> loadFavorites()async{
    final prefs = await SharedPreferences.getInstance();
    final stringList = prefs.getStringList(favsKey) ?? [];
    final updatedList = stringList.map((movie)=> MovieModel.fromJson(jsonDecode(movie))).toList();
    state = state.copyWith(favoritesList: updatedList);
    
  }

  void clearFavs(){
    // state.favoritesList.clear();
    state = state.copyWith(favoritesList: []);
    saveFavorites();
  }

}
