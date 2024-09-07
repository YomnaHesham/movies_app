import 'package:flutter/material.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/widgets/movie_item.dart';
import 'package:movies/widgets/movie_item_model.dart';
import 'package:movies/screens/movie_details_screen.dart';
import 'package:movies/screens/tabs/home/popular_movies_model.dart';

class PopularMovies extends StatelessWidget {
  final PopularMoviesModel popularMoviesModel;

  PopularMovies({required this.popularMoviesModel, super.key});

  @override
  Widget build(BuildContext context) {
    String posterUrl = 'https://image.tmdb.org/t/p/w500${popularMoviesModel.imagePath}';
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    posterUrl,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.30,
                    fit: BoxFit.fill,
                  ),
                  IconButton(
                    icon: const Icon(Icons.play_circle,
                        size: 60, color: AppTheme.white),
                    onPressed: () {},
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.60,
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      popularMoviesModel.title,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      popularMoviesModel.releaseDate,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 24,
            left: 20,
            child: MovieItem(
              movieItemModel: MovieItemModel(width: 129, height: 199, imagePath: posterUrl),
            ),
          ),
        ],
      ),
    );
  }
}
