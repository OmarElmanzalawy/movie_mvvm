import 'package:movie_mvvm/models/movie_genre.dart';
import 'package:movie_mvvm/repository/movies_repo.dart';
import 'package:movie_mvvm/service/init_getit.dart';

class GenreUtils {
  static List<MovieGenre> movieGenreNames(List<int> genreIds){
    final _movieRepo = getIt<MoviesRepo>();
    final cachedGenres = _movieRepo.cachedGenres;
    List<MovieGenre> genreNames = [];
    for (var genreId in genreIds){
      var genre = cachedGenres.firstWhere((g)=>g.id == genreId,orElse: ()=>MovieGenre(id: 5448484, name: 'Unkown'));
      genreNames.add(genre);
    }
    return genreNames;
  }
}