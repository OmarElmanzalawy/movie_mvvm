import 'package:flutter/material.dart';
import 'package:movie_mvvm/constants/app_icons.dart';
import 'package:movie_mvvm/enums/theme_enums.dart';
import 'package:movie_mvvm/repository/movies_repo.dart';
import 'package:movie_mvvm/screens/favorite_screen.dart';
import 'package:movie_mvvm/service/init_getit.dart';
import 'package:movie_mvvm/service/navigation_service.dart';
import 'package:movie_mvvm/view_model/movies_provider.dart';
import 'package:movie_mvvm/view_model/theme_provider.dart';
import 'package:movie_mvvm/widgets/movies/movie_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
    title: const Text('Popular Movies'),
    actions: [
      IconButton(
        onPressed: () {
          getIt<NavigationService>().navigate(const FavoriteScreen());
        },
        icon: const Icon(AppIcons.favoriteRounded),
        color: Colors.red,
      ),
      Consumer(builder: (context, ref, child) {
        final themeMode = ref.watch(themeProvider);
        return IconButton(
            onPressed: () async {
              await ref.read(themeProvider.notifier).toggleTheme();
            },
            icon: Icon(themeMode == ThemeEnums.dark
                ? AppIcons.lightMode
                : AppIcons.darkMode));
      }),
    ],
          ),
          body: Consumer(
    builder: (context, ref, child) {
      final movieState = ref.watch(moviesProvider);
      //final currentMovie = ref.read(currentMovie)
      if (movieState.isLoading && movieState.moviesList.isEmpty) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      } else if (movieState.fetchMoviesError.isNotEmpty) {
        return Center(
          child: Text(movieState.fetchMoviesError),
        );
      }
      return NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels ==
                  scrollInfo.metrics.maxScrollExtent &&
              !movieState.isLoading) {
            ref.read(moviesProvider.notifier).getMovies();
          }
          return true;
        },
        child: ListView.builder(
            itemCount: movieState.moviesList.length,
            itemBuilder: (context, index) {
              return MovieCard(movieModel: ref.read(currentMovie(index)),);
            }),
      );
    },
          ),
        );
  }
}
