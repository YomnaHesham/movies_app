import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/apis/api_manager.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/widgets/error_indicator.dart';
import 'package:movies/widgets/recommended_item.dart';
import 'package:movies/widgets/movie_item.dart';
import 'package:movies/widgets/movie_item_model.dart';
import 'package:movies/screens/movie_details_screen.dart';
import 'package:movies/screens/tabs/home/popular_movies.dart';
import 'package:movies/screens/tabs/home/popular_movies_model.dart';
import 'package:movies/widgets/not_available_indicator.dart';
import 'package:movies/widgets/recommended_model.dart';
import 'package:movies/widgets/waiting_indicator.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FutureBuilder(
            future: ApiManager.getPopular(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const WaitingIndicator();
              } else if (!snapshot.hasData || snapshot.data?.results == null) {
                return const NotAvailableIndicator();
              } else if (snapshot.hasError) {
                return const ErrorIndicator();
              } else {
                var popularMovies = snapshot.data!.results!
                    .map<PopularMoviesModel>((movieData) {
                  return PopularMoviesModel(
                      title: movieData.title ?? "No Title",
                      releaseDate: movieData.releaseDate ?? "Unknown Date",
                      imagePath: movieData.posterPath ?? "",
                      id: movieData.id ?? 0);
                }).toList();
                return CarouselSlider.builder(
                  itemCount: popularMovies.length,
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.45,
                    enlargeCenterPage: false,
                    viewportFraction: 1.0,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                  ),
                  itemBuilder: (context, index, realIndex) {
                    final movie = popularMovies[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(MovieDetailsScreen.routName);
                      },
                      child: PopularMovies(popularMoviesModel: movie),
                    );
                  },
                );
              }
            },
          ),
          FutureBuilder(
            future: ApiManager.getNewReleases(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const WaitingIndicator();
              } else if (!snapshot.hasData || snapshot.data?.results == null) {
                return NotAvailableIndicator();
              } else if (snapshot.hasError) {
                return const ErrorIndicator();
              } else {
                var newReleases =
                    snapshot.data!.results!.map<MovieItemModel>((newMovie) {
                  return MovieItemModel(
                    width: 96,
                    height: 127,
                    imagePath: newMovie.posterPath ?? "",
                  );
                }).toList();
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(MovieDetailsScreen.routName);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.infinity,
                    color: AppTheme.grayBG,
                    padding: const EdgeInsets.all(24),
                    margin: const EdgeInsets.only(top: 16, bottom: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "New Releases",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 12,
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final newMovie = newReleases[index];
                              return MovieItem(movieItemModel: newMovie);
                            },
                            itemCount: newReleases.length,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            },
          ),
          FutureBuilder(
            future: ApiManager.getRecommended(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const WaitingIndicator();
              } else if (!snapshot.hasData || snapshot.data?.results == null) {
                return const NotAvailableIndicator();
              } else if (snapshot.hasError) {
                return const ErrorIndicator();
              } else {
                var recommended = snapshot.data!.results!
                    .map<RecommendedModel>((recommendMovie) {
                  return RecommendedModel(
                    title: recommendMovie.title ?? "No Title ",
                    releasedDate: recommendMovie.releaseDate ?? "Unknown Date",
                    rate: recommendMovie.voteAverage ?? 0,
                    imagePath: recommendMovie.posterPath ?? "",
                  );
                }).toList();
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(MovieDetailsScreen.routName);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: double.infinity,
                    color: AppTheme.grayBG,
                    padding: const EdgeInsets.all(24),
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Recommended",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 8,
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final recommendedMovie = recommended[index];
                              return RecommendedItem(
                                  recommendedModel: recommendedMovie);
                            },
                            itemCount: recommended.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
