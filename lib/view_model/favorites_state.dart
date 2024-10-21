import 'package:movie_mvvm/models/movie_model.dart';

class FavoritesState {
  final List<MovieModel> favoritesList;

  FavoritesState(
      {this.favoritesList = const []});

  FavoritesState copyWith({
    List<MovieModel>? favoritesList,
    
  }){
    return FavoritesState(
      favoritesList: favoritesList ?? this.favoritesList
    );
  }
}
