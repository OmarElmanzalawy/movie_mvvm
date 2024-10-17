import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {

  static String apiKey = dotenv.get('MOIVES_API_KEY');
  static String bearerToken = dotenv.get('MOVIES_BEARER_TOKEN');
  static String baseUrl = 'https://api.themoviedb.org/3';
  static String backdropImageBaseUrl = 'https://image.tmdb.org/t/p/w500/';

  static Map<String,String> get headers => {
    'Authorization': 
    'Bearer $bearerToken',
    'accept': 'application/json',
  };

}