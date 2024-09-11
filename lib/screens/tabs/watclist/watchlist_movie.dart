import 'package:flutter/material.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/screens/tabs/watclist/watchlist_movie_model.dart';
import 'package:movies/widgets/movie_item.dart';
import 'package:movies/widgets/movie_item_model.dart';

class WatchlistMovie extends StatelessWidget {
  WatchlistMovieModel watchlistMovieModel;

  WatchlistMovie({required this.watchlistMovieModel, super.key});

  @override
  Widget build(BuildContext context) {
    String posterUrl =
        'https://image.tmdb.org/t/p/w500${watchlistMovieModel.model.imagePath}';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              MovieItem(
                movieItemModel: MovieItemModel(
                    height: 90, width: 140, imagePath: posterUrl),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    watchlistMovieModel.title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    watchlistMovieModel.releaseDate,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppTheme.white,
                        ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        size: 32,
                        color: AppTheme.primary,
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Text(
                        watchlistMovieModel.rate,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppTheme.white,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          const Divider(
            color: AppTheme.line,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
