import 'package:flutter/material.dart';
import 'package:movie_mvvm/constants/app_icons.dart';
import 'package:movie_mvvm/models/movie_model.dart';

class FavoriteBtnWidget extends StatefulWidget {
  const FavoriteBtnWidget({super.key, required this.movieModel});
  final MovieModel movieModel;

  @override
  State<FavoriteBtnWidget> createState() => _FavoriteBtnWidgetState();
}

class _FavoriteBtnWidgetState extends State<FavoriteBtnWidget> {
  final favoriteMovieIds = [];
  @override
  Widget build(BuildContext context) {
    bool isFavorite = favoriteMovieIds.contains(widget.movieModel.id);
    return IconButton(
      onPressed: () {
        setState(() {
          isFavorite
            ? favoriteMovieIds.remove(widget.movieModel.id)
            : favoriteMovieIds.add(widget.movieModel.id);
        });
      },
      icon: Icon(
        isFavorite ?
        AppIcons.favoriteRounded : AppIcons.favoriteOutlinedRounded,
        color: isFavorite ? Colors.red : null,
        size: 20,
      ),
      //color: Colors.red,
    );
  }
}
