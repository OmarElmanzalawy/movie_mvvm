import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mvvm/constants/api_constants.dart';
import 'package:movie_mvvm/constants/app_constants.dart';
import 'package:movie_mvvm/constants/app_icons.dart';
import 'package:movie_mvvm/models/movie_model.dart';
import 'package:movie_mvvm/widgets/cached_image.dart';

class CarouselMovie extends ConsumerWidget {
  const CarouselMovie({super.key,required this.movieModel});
  final MovieModel movieModel;

  @override
  Widget build(BuildContext context, WidgetRef ref,) {
    return Stack(
      children: [
        Container(
        //height: 320,
        width: 200,
        color: Colors.white,
        child: CachedImageWidget(
          url: "${ApiConstants.backdropImageBaseUrl}${movieModel.backdropPath}" ?? AppConstants.bladeRunner,
          fit: BoxFit.cover,
          ),
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: Container(
          constraints: BoxConstraints(minWidth: 50,maxWidth: 65),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(20),
            //shape: BoxShape.circle
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(AppIcons.star,color: Colors.amber,),
              SizedBox(width: 5,),
              Text('${movieModel.voteAverage!.toStringAsFixed(1)}',style: TextStyle(color: Colors.black),)
            ],
          ),
        ),
      )
      ]
    );
  }
}