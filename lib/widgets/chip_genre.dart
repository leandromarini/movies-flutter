import 'package:flutter/material.dart';

class ChipGenre extends StatelessWidget {
  final String genre;

  const ChipGenre(this.genre);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Chip(
        label: Text(
          genre,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red.withOpacity(0.9),
      ),
      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
    );
  }
}
