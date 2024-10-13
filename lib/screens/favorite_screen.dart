import 'package:flutter/material.dart';
import 'package:movie_mvvm/constants/app_icons.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favorite Movies'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(AppIcons.delete),
            color: Colors.red,
          ),
        ],
      ),
      body: Center(child: Text('Favorite Movies'),)
      );
  }
}