import 'package:get_it/get_it.dart';
import 'package:movie_mvvm/repository/movies_repo.dart';
import 'package:movie_mvvm/service/api_service.dart';
import 'package:movie_mvvm/service/navigation_service.dart';

GetIt getIt = GetIt.instance;

void setupLocator(){

  getIt.registerLazySingleton<NavigationService>(()=> NavigationService());
  getIt.registerLazySingleton<ApiService>(()=> ApiService());
  getIt.registerLazySingleton<MoviesRepo>(()=> MoviesRepo(getIt<ApiService>()));
}