import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mvvm/constants/app_icons.dart';
import 'package:movie_mvvm/models/movie_model.dart';
import 'package:movie_mvvm/view_model/favorites_provider.dart';

class FavoriteBtnWidget extends ConsumerWidget {
  const FavoriteBtnWidget({super.key, required this.movieModel});
  final MovieModel movieModel;
@override
  Widget build(BuildContext context,WidgetRef ref) {
    // bool isFavorite = favoriteMovieIds.contains(widget.movieModel.id);
    final favoriteList = ref.watch(favoritesProvider.select((state)=> state.favoritesList));
    final isFavorite = favoriteList.any((movie) => movie.id == movieModel.id);
    return IconButton(
      onPressed: () {
        ref.read(favoritesProvider.notifier).addOrRemoveFromFavorites(movieModel);
      },
      icon: Icon(
        isFavorite 
        ?
        AppIcons.favoriteRounded
        :AppIcons.favoriteOutlinedRounded,
        size: 20,
      ),
      color: isFavorite ? Colors.red: null,
    );
  }
}