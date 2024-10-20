import 'package:flutter/material.dart';
import 'package:movie_mvvm/constants/app_constants.dart';
import 'package:movie_mvvm/models/movie_genre.dart';
import 'package:movie_mvvm/models/movie_model.dart';
import 'package:movie_mvvm/utils/genre_utils.dart';

class GenreList extends StatelessWidget {
  const GenreList({super.key, required this.movieModel,});
  final MovieModel movieModel;
  @override
  Widget build(BuildContext context) {
    List<MovieGenre> movieGenre =[];
        // GenreUtils.movieGenreNames(movieModel.genreIds!);
    return Wrap(
        children: List.generate(
            movieGenre.length,
            (index) => chipWidget(
                genreName: movieGenre[index].name, context: context)));
  }

  Widget chipWidget(
      {required String genreName, required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Theme.of(context).colorScheme.surface.withOpacity(0.2),
          border: Border.all(
            color: Theme.of(context).colorScheme.surface,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: Text(
            genreName,
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
