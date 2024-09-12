import 'package:flutter/material.dart';
import 'package:movies/apis/api_manager.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/screens/movie_details_screen.dart';
import 'package:movies/widgets/error_indicator.dart';
import 'package:movies/widgets/movie_item.dart';
import 'package:movies/widgets/movie_item_model.dart';
import 'package:movies/widgets/not_available_indicator.dart';

import 'package:movies/widgets/waiting_indicator.dart';

class MoviesCategory extends StatelessWidget {
  static const String routName = "movie_category";

  MoviesCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final genreId = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
            future: ApiManager.getGenreMovie(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const WaitingIndicator();
              } else if (!snapshot.hasData || snapshot.data?.genres == null) {
                return const NotAvailableIndicator();
              } else if (snapshot.hasError) {
                return const ErrorIndicator();
              } else {
                var genres = snapshot.data?.genres ?? [];
                var selectedGenre = genres.firstWhere(
                  (genre) => genre.id == genreId,
                );
                String genreName = selectedGenre.name ?? "Unknown Genre";
                return Text(genreName);
              }
            }),
      ),
      body: FutureBuilder(
        future: ApiManager.getMovieCategory(genreId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const WaitingIndicator();
          } else if (!snapshot.hasData || snapshot.data?.results == null) {
            return const NotAvailableIndicator();
          } else if (snapshot.hasError) {
            return const ErrorIndicator();
          } else {
            var result = snapshot.data?.results
                    ?.where((movie) =>
                        movie.genreIds != null &&
                        movie.genreIds!.contains(genreId))
                    .toList() ??
                [];
            if (result.isEmpty) {
              return const NotAvailableIndicator();
            }
            return Container(
              padding: const EdgeInsets.all(16),
              color: AppTheme.blackBG,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
                itemBuilder: (context, index) {
                  var movie = result[index];
                  String imagePath =
                      'https://image.tmdb.org/t/p/w500${movie.posterPath ?? ""}';
                  String title = movie.title ?? "No Title";
                  double rate = movie.voteAverage ?? 0;
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          MovieDetailsScreen.routName,
                          arguments: result[index].id);
                    },
                    child: Card(
                      elevation: 16,
                      color: AppTheme.grayBG,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 90,
                            child: MovieItem(
                              movieItemModel: MovieItemModel(
                                  width: double.infinity,
                                  height: double.infinity,
                                  imagePath: imagePath),
                              title: title,
                              date: movie.releaseDate ?? "Unknown Date",
                              rate: rate,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  title,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  softWrap: true,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, bottom: 8.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 18,
                                      color: AppTheme.primary,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      rate.toString().substring(0, 3),
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: result.length,
              ),
            );
          }
        },
      ),
    );
  }
}
