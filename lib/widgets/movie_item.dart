import 'package:flutter/material.dart';
import 'package:movies/widgets/add_to_watchlist_item.dart';
import 'package:movies/widgets/movie_item_model.dart';
import 'package:movies/widgets/recommended_model.dart';

class MovieItem extends StatelessWidget {
  MovieItemModel movieItemModel;
  String title;
  String date;
  double rate;

  MovieItem(
      {required this.movieItemModel,
      required this.title,
      required this.date,
      required this.rate,
      super.key});

  @override
  Widget build(BuildContext context) {
    String posterUrl =
        'https://image.tmdb.org/t/p/w500${movieItemModel.imagePath}';
    RecommendedModel recommendedModel = RecommendedModel(
        title: title, rate: rate, releasedDate: date, imagePath: posterUrl);
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            posterUrl,
            width: movieItemModel.width,
            height: movieItemModel.height,
            fit: BoxFit.fill,
          ),
        ),
        AddToWatchlistItem(movie: recommendedModel),
      ],
    );
  }
}
