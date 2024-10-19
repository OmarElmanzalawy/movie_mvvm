import 'package:flutter/material.dart';
import 'package:movie_mvvm/constants/app_icons.dart';
import 'package:movie_mvvm/enums/theme_enums.dart';
import 'package:movie_mvvm/repository/movies_repo.dart';
import 'package:movie_mvvm/screens/favorite_screen.dart';
import 'package:movie_mvvm/service/init_getit.dart';
import 'package:movie_mvvm/service/navigation_service.dart';
import 'package:movie_mvvm/view_model/theme_provider.dart';
import 'package:movie_mvvm/widgets/movies/movie_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesScreen extends ConsumerWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Popular Movies'),
          actions: [
            IconButton(
              onPressed: () {
                getIt<NavigationService>().navigate(const FavoriteScreen());
              },
              icon: const Icon(AppIcons.favoriteRounded),
              color: Colors.red,
            ),
            IconButton(onPressed: () async{
              await ref.read(themeProvider.notifier).toggleTheme();
            },
             icon: Icon(themeMode == ThemeEnums.dark ? AppIcons.lightMode : AppIcons.darkMode)  ),
          ],
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context,index){


            return MovieCard();

            }
  
          
          )
        ),
    );
  }
}