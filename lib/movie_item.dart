import 'package:flutter/material.dart';
import 'package:movies/add_to_watchlist_item.dart';

class MovieItem extends StatelessWidget {
  double width;
  double height;
  String imagePath;

  MovieItem(
      {required this.width,
      required this.height,
      required this.imagePath,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("New Movies");
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              imagePath,
              width: width,
              height: height,
              fit: BoxFit.fill,
            ),
          ),
          AddToWatchlistItem(),
        ],
      ),
    );
  }
}
