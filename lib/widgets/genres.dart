import 'package:flutter/material.dart';

class Genres extends StatelessWidget {
  final List genre;

  Genres(this.genre);

  String getGenreList(genresList) {
    List<String> genres = [];
    genresList.forEach((genre) {
      genres.add(genre.name);
    });
    return genres.join(' | ');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '${getGenreList(genre)}',
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }
}
