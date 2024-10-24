import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_mvvm/models/movie_model.dart';
import 'package:movie_mvvm/view_model/movies_provider.dart';
import 'package:movie_mvvm/widgets/movies/carousel_movie.dart';

class CarouselMovieView extends StatelessWidget {
  const CarouselMovieView({super.key,required this.movieList});
  final List<MovieModel> movieList;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text('Most Popular Movies',
          style: TextStyle(
            fontSize: 35
          ),
          ),
        ),

        Stack(
                    children: [
                      Container(
                      //color: Colors.red,
                      height: 320,
                    ),
                    Container(
                      height: 300,
                      child: Align(
                        alignment: Alignment.center,
                        child: CarouselSlider.builder(
                          itemCount: 5, 
                          itemBuilder: (context,index,pageViewIndex){
                           return CarouselMovie(movieModel: movieList[index],);
                          }, 
                          options: CarouselOptions(
                            //autoPlay: true,
                            viewportFraction: 0.45,
                            enlargeCenterPage: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          )
                          ),
                      ),
                    ),
                    ]
                  ),
      ],
    );
  }
}