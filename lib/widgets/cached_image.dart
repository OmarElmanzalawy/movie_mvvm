import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_mvvm/constants/app_icons.dart';

class CachedImageWidget extends StatelessWidget {

  final String url;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const CachedImageWidget({super.key, required this.url, this.height, this.width, this.fit});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CachedNetworkImage(
      imageUrl: url,
      width: width ?? size.width * 0.2,
      height: height ?? size.height * 0.3,
      fit: fit ?? BoxFit.cover,
      errorWidget: (context,url,error) => const Icon(
        AppIcons.error,
        color: Colors.red,
      ),
      );
  }
}