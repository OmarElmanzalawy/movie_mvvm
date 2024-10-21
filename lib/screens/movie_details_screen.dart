import 'package:flutter/material.dart';
import 'package:movie_mvvm/constants/api_constants.dart';
import 'package:movie_mvvm/constants/app_constants.dart';
import 'package:movie_mvvm/models/movie_model.dart';
import 'package:movie_mvvm/widgets/cached_image.dart';
import 'package:movie_mvvm/widgets/movies/favorite_btn.dart';
import 'package:movie_mvvm/widgets/movies/genre_list.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movieModel, });

  final MovieModel movieModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            //Image
            SizedBox(
              height: size.height * 0.45,
              width: double.infinity,
              child:  Hero(
                tag: '${movieModel.id}',
                child: CachedImageWidget(
                  url: '${ApiConstants.backdropImageBaseUrl}${movieModel.backdropPath}' ?? AppConstants.bladeRunner,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.4,
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Material(
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 25),
                                 Text(
                                  movieModel.title?? 'Not found',
                                  maxLines: 2,
                                  style: TextStyle(
                                    // color: Theme.of(context).textSelectionColor,
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const SizedBox(height: 5.0),
                                 Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                        "${movieModel.voteAverage!.toStringAsFixed(1)}/10"
                                      ),
                                    Spacer(),
                                    Text(
                                      movieModel.releaseDate ?? 'Release Date',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                 GenreList(
                                  movieModel: movieModel,
                                  ),
                                const SizedBox(height: 15),
                                Text(
                                  movieModel.overview ?? 'No Description found',
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            shape: BoxShape.circle,
                          ),
                          child:  Padding(
                            padding: EdgeInsets.all(6.0),
                            child: FavoriteBtnWidget(
                              movieModel: movieModel,
                              ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 5,
              left: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const BackButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
