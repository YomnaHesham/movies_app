import 'package:flutter/material.dart';
import 'package:movies/widgets/add_to_watchlist_item.dart';
import 'package:movies/widgets/movie_item_model.dart';

class MovieItem extends StatelessWidget {
  MovieItemModel movieItemModel;

  MovieItem(
      {required this.movieItemModel,
      super.key});

  @override
  Widget build(BuildContext context) {
    String posterUrl = 'https://image.tmdb.org/t/p/w500${movieItemModel.imagePath}';

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.network(
            posterUrl,
            width: movieItemModel.width,
            height: movieItemModel.height,
            fit: BoxFit.fill,
          ),
        ),
        AddToWatchlistItem(),
      ],
    );
  }
}
