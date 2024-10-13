import 'package:flutter/material.dart';
import 'package:movie_mvvm/constants/app_icons.dart';

class FavoriteBtnWidget extends StatelessWidget {
  const FavoriteBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
            onPressed: () {},
            icon: const Icon(AppIcons.favoriteOutlinedRounded,
            size: 20,
            ),
            //color: Colors.red,
            
          );
  }
}