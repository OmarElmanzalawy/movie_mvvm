import 'package:flutter/material.dart';
import 'package:movie_mvvm/constants/app_constants.dart';
import 'package:movie_mvvm/constants/app_icons.dart';
import 'package:movie_mvvm/widgets/cached_image.dart';
import 'package:movie_mvvm/widgets/movies/favorite_btn.dart';
import 'package:movie_mvvm/widgets/movies/genre_list.dart';

class MovieCard extends StatelessWidget {

  final double? rating;
  final String title;
  final String? releaseDate;
  final String movieUrl;

  const MovieCard({super.key, this.rating, required this.title, this.releaseDate, required this.movieUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IntrinsicWidth(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedImageWidget(
                  url: AppConstants.bladeRunner,
                  width: 90,
                  height: 130,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
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
                          Text('${rating.toString() ?? 7.5}/10'),
                        ],
                      ),
                      //SizedBox(height: 25,),
                      GenreList(),
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
                          Text(releaseDate ?? 'Release Date',style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black54
                          ),),
                          const Spacer(),
                          const FavoriteBtnWidget(),
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
