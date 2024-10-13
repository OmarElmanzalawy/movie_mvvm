import 'package:flutter/material.dart';
import 'package:movie_mvvm/constants/app_theme_data.dart';
import 'package:movie_mvvm/screens/favorite_screen.dart';
import 'package:movie_mvvm/screens/movie_details_screen.dart';
import 'package:movie_mvvm/screens/movies_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: AppThemeData.lightTheme,
      home: const MovieDetailsScreen(),
    );
  }
}
