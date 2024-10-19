import 'package:flutter/material.dart';
import 'package:movie_mvvm/constants/api_constants.dart';
import 'package:movie_mvvm/constants/app_constants.dart';
import 'package:movie_mvvm/constants/app_icons.dart';
import 'package:movie_mvvm/models/movie_model.dart';
import 'package:movie_mvvm/screens/movie_details_screen.dart';
import 'package:movie_mvvm/service/init_getit.dart';
import 'package:movie_mvvm/service/navigation_service.dart';
import 'package:movie_mvvm/widgets/cached_image.dart';
import 'package:movie_mvvm/widgets/movies/favorite_btn.dart';
import 'package:movie_mvvm/widgets/movies/genre_list.dart';

class MovieCard extends StatelessWidget {

  
  final MovieModel movieModel;

  const MovieCard({super.key, required this.movieModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: (){
        getIt<NavigationService>().navigate( MovieDetailsScreen(movieModel: movieModel,));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IntrinsicWidth(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: '${movieModel.id}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedImageWidget(
                    url: "${ApiConstants.backdropImageBaseUrl}${movieModel.backdropPath}",
                    width: 90,
                    height: 130,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieModel.title ?? 'No Title',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(
                            AppIcons.star,
                            color: Colors.amber,
                          ),
                          SizedBox(width: 5,),
                          Text('${movieModel.voteAverage ?? 7.5}/10'),
                        ],
                      ),
                      //SizedBox(height: 25,),
                      GenreList(movieModel: movieModel,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        
                        children: [
                          Icon(
                            AppIcons.clock,
                            color: Colors.teal,
                            size: 20,
                          ),
                          SizedBox(width: 5,),
                          Text(movieModel.releaseDate ?? 'Release Date',style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black54
                          ),),
                          const Spacer(),
                           FavoriteBtnWidget(movieModel: movieModel,),
                        ],
                      )
                    ],
                    
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
