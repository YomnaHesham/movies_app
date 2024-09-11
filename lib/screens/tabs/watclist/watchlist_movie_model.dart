import 'package:movies/widgets/movie_item_model.dart';

class WatchlistMovieModel {
  MovieItemModel model;
  String title;
  String releaseDate;
  String rate;

  WatchlistMovieModel({
    required this.model,
    required this.title,
    required this.releaseDate,
    required this.rate,
  });
}

