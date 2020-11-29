import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String posterPath;
  final Function onTap;

  const MovieCard({
    Key key,
    this.posterPath,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: FancyShimmerImage(
          imageUrl: 'https://image.tmdb.org/t/p/w220_and_h330_face$posterPath',
        ));
  }
}
