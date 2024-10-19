import 'package:movie_mvvm/models/movie_genre.dart';
import 'package:movie_mvvm/models/movie_model.dart';
import 'package:movie_mvvm/service/api_service.dart';

class MoviesRepo {

  final ApiService _apiService;
  MoviesRepo(this._apiService);

  Future<List<MovieModel>> fetchMovies({int? page})async{
    return await _apiService.fetchMovies(page: page);
  }

  List<MovieGenre> cachedGenres = [];
  Future<List<MovieGenre>> fetchGenres()async{
    return cachedGenres = await _apiService.fetchGenres();
  }

}