import 'package:flutter/material.dart';
import 'package:movie_mvvm/constants/app_icons.dart';

class FavoriteBtnWidget extends StatelessWidget {
  const FavoriteBtnWidget({super.key});

@override
  Widget build(BuildContext context) {
    // bool isFavorite = favoriteMovieIds.contains(widget.movieModel.id);
    return IconButton(
      onPressed: () {
        //TODO IMPLEMENT FAVORITE LOGIC
      },
      icon: Icon(
        AppIcons.favoriteOutlinedRounded,
        size: 20,
      ),
      //color: Colors.red,
    );
  }
}