import 'package:flutter/material.dart';
import 'package:movie_mvvm/widgets/movies/error_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyErrorWidget(),
    );
  }
}