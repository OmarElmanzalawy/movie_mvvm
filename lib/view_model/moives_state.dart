import 'package:movie_mvvm/models/movie_genre.dart';
import 'package:movie_mvvm/models/movie_model.dart';

class MoivesState {
  final int currentPage;
  final List<MovieModel> moviesList;
  final List<MovieGenre> genreList;
  final bool isLoading;
  final String fetchMoviesError;

  MoivesState(
      {this.currentPage = 1,
      this.moviesList = const [],
      this.genreList = const [],
      this.isLoading = false,
      this.fetchMoviesError = ''});

  MoivesState copyWith({
    int? currentPage,
    List<MovieModel>? moviesList,
    List<MovieGenre>? genresList,
    bool? isLoading,
    String? fetchMoviesError,
  }){
    return MoivesState(
      currentPage: currentPage ?? this.currentPage,
       moviesList: moviesList ?? this.moviesList,
       genreList: genresList ?? this.genreList,
       isLoading: isLoading ?? this.isLoading,
       fetchMoviesError: fetchMoviesError ?? this.fetchMoviesError
    );
  }
}
