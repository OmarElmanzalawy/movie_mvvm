import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:movie_mvvm/constants/api_constants.dart';
import 'package:movie_mvvm/models/movie_genre.dart';
import 'package:movie_mvvm/models/movie_model.dart';

class ApiService {
  Future<List<MovieModel>> fetchMovies({int? page})async{
    final url = Uri.parse(
      '${ApiConstants.baseUrl}/movie/popular?language=en-US&page=${page??1}'
    );
    final response = await http.get(url,headers: ApiConstants.headers).timeout(const Duration(seconds: 10));
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      //print('data: $data');
      final List<MovieModel> result=  List.from((data['results'].map)((element)=> MovieModel.fromJson(element)));
      //print(result);
      return result;
    }
    else{ throw Exception('Failed to load movies: ${response.statusCode}');}
  }

  //TODO THIS IS WHERE YOU LEFT OFF, COMPLETE THIS FUNCTION TO FETCH GENRES
  Future<List<MovieGenre>> fetchGenres()async{
    final url = Uri.parse(
      '${ApiConstants.baseUrl}/genre/movie/list?language=en',
    );
    final response = await http.get(url,headers: ApiConstants.headers).timeout(const Duration(seconds: 10));

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      final List<MovieGenre> result = List.from((data['genres'].map)((element) => MovieGenre.fromJson(element)));
      print('Movie Genre: $result');
      return result;
    }
    else{ throw Exception('Failed to load movies: ${response.statusCode}');}

  }

}