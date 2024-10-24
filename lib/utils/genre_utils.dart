import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mvvm/models/movie_genre.dart';
import 'package:movie_mvvm/repository/movies_repo.dart';
import 'package:movie_mvvm/service/init_getit.dart';
import 'package:movie_mvvm/view_model/movies_provider.dart';

class GenreUtils {
  static List<MovieGenre> movieGenreNames(List<int> genreIds,WidgetRef ref){
    final movieState = ref.watch(moviesProvider);
    final _movieRepo = getIt<MoviesRepo>();
    final cachedGenres = movieState.genreList; //TODO FETCH RIGHT CACHED GENRES
    List<MovieGenre> genreNames = [];
    for (var genreId in genreIds){
      var genre = cachedGenres.firstWhere((g)=>g.id == genreId,orElse: ()=>MovieGenre(id: 5448484, name: 'Unkown'));
      genreNames.add(genre);
    }
    return genreNames;
  }
}