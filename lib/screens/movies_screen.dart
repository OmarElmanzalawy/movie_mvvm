import 'package:flutter/material.dart';
import 'package:movie_mvvm/constants/app_constants.dart';
import 'package:movie_mvvm/constants/app_icons.dart';
import 'package:movie_mvvm/widgets/cached_image.dart';
import 'package:movie_mvvm/widgets/movies/movie_card.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Popular Movies'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(AppIcons.favoriteRounded),
              color: Colors.red,
            ),
            IconButton(onPressed: () {}, icon: const Icon(AppIcons.darkMode)),
          ],
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context,index){
            return Padding(padding: 
            const EdgeInsets.all(8.0),
            child: MovieCard(movieUrl: AppConstants.bladeRunner,title: 'Blade Runner 2048',rating: 8,),
            );
          }
          )
        ),
    );
  }
}
