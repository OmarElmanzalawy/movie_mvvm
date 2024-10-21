import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mvvm/models/movie_model.dart';
import 'package:movie_mvvm/repository/movies_repo.dart';
import 'package:movie_mvvm/service/init_getit.dart';
import 'package:movie_mvvm/view_model/moives_state.dart';

final moviesProvider = StateNotifierProvider<MoviesProvider,MoivesState>((ref) => MoviesProvider());

final currentMovie = Provider.family<MovieModel,int>((ref, index) {
  final movieState = ref.watch(moviesProvider);
  return movieState.moviesList[index];
},);

class MoviesProvider extends StateNotifier<MoivesState>{
  MoviesProvider():super(MoivesState());
  final MoviesRepo _moviesRepo = getIt<MoviesRepo>();
  Future<void> getMovies()async{
    if(state.isLoading)return;
    state = state.copyWith(isLoading: true);
    try{
      if(state.genreList.isEmpty){
        final genresList = await _moviesRepo.fetchGenres();
        state = state.copyWith(genresList: genresList);
      }
      List<MovieModel> movies = await _moviesRepo.fetchMovies(page: state.currentPage);
      state = state.copyWith(
        moviesList: [...state.moviesList,...movies],
        currentPage: state.currentPage+1,
        fetchMoviesError: '',
        isLoading: false,
        );
    }
    catch(e){
      state = state.copyWith(fetchMoviesError: e.toString(),isLoading: false);
      rethrow;
    }
  }
}