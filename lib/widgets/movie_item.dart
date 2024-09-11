import 'package:flutter/material.dart';
import 'package:movies/screens/tabs/watclist/watchlist_movie_model.dart';
import 'package:movies/widgets/add_to_watchlist_item.dart';
import 'package:movies/widgets/movie_item_model.dart';

class MovieItem extends StatelessWidget {
  MovieItemModel movieItemModel;

  MovieItem({required this.movieItemModel, super.key});

  @override
  Widget build(BuildContext context) {
    String posterUrl =
        'https://image.tmdb.org/t/p/w500${movieItemModel.imagePath}';
    WatchlistMovieModel watchlistMovieModel = WatchlistMovieModel(
      model: movieItemModel,
      title: "Movie Title", // You can get this from the model if available
      releaseDate: "2022", // This should come from movieItemModel if available
      rate: "8.0", // This should also come from movieItemModel if available
    );
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
        AddToWatchlistItem(movie: watchlistMovieModel),
      ],
    );
  }
}
