import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_mvvm/constants/app_icons.dart';
import 'package:movie_mvvm/view_model/favorites_provider.dart';
import 'package:movie_mvvm/widgets/movies/movie_card.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final favoritesProviderList = ref.watch(favoritesProvider).favoritesList;
    print(favoritesProviderList.length);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favorite Movies'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(favoritesProvider.notifier).clearFavs();
            },
            icon: const Icon(AppIcons.delete),
            color: Colors.red,
          ),
        ],
      ),
      body: favoritesProviderList.isEmpty ? 
      Center(child: Text('No Favorites Added',),)
      : ListView.builder(
        itemCount: favoritesProviderList.length,
        itemBuilder: (context,index){
          return MovieCard(movieModel: favoritesProviderList[index]);
        }
        )
      );
  }
}