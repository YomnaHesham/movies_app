import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/apis/api_manager.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/movie_card.dart';
import 'package:movies/movie_item.dart';
import 'package:movies/screens/movie_details_screen.dart';
import 'package:movies/screens/popular_movies.dart';
import 'package:movies/screens/tabs/popular_movies_model.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int currentIndex = 0;

  List<MovieItem> releaseMovie = [
    MovieItem(
      width: 96,
      height: 127,
      imagePath: "assets/images/test.png",
    ),
    MovieItem(
      width: 96,
      height: 127,
      imagePath: "assets/images/test.png",
    ),
    MovieItem(
      width: 96,
      height: 127,
      imagePath: "assets/images/test.png",
    ),
    MovieItem(
      width: 96,
      height: 127,
      imagePath: "assets/images/test.png",
    ),
    MovieItem(
      width: 96,
      height: 127,
      imagePath: "assets/images/test.png",
    ),
    MovieItem(
      width: 96,
      height: 127,
      imagePath: "assets/images/test.png",
    ),
    MovieItem(
      width: 96,
      height: 127,
      imagePath: "assets/images/test.png",
    ),
    MovieItem(
      width: 96,
      height: 127,
      imagePath: "assets/images/test.png",
    ),
  ];

  List<MovieCard> recommendedMovie = [
    const MovieCard(),
    const MovieCard(),
    const MovieCard(),
    const MovieCard(),
    const MovieCard(),
  ];

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
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppTheme.primary,
                    ),
                  ),
                );
              } else if (!snapshot.hasData || snapshot.data?.results == null) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "No data available",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Something Went Wrong",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                );
              } else {
                var popularMovies = snapshot.data!.results!
                    .map<PopularMoviesModel>((movieData) {
                  return PopularMoviesModel(
                    title: movieData.title ?? "No Title",
                    releaseDate: movieData.releaseDate ?? "Unknown Date",
                    imagePath: movieData.posterPath ?? "",
                  );
                }).toList();
                return CarouselSlider.builder(
                  itemCount: popularMovies.length,
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.40,
                    // Set height of carousel
                    enlargeCenterPage: false,
                    viewportFraction: 1.0,
                    // Enlarge the centered item
                    autoPlay: true,
                    // Enable autoplay
                    autoPlayInterval: const Duration(seconds: 3),
                  ),
                  itemBuilder: (context, index, realIndex) {
                    final movie = popularMovies[index];
                    return PopularMovies(popularMoviesModel: movie);
                  },
                );
              }
            },
          ),
          FutureBuilder(
              future: ApiManager.getPopular(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppTheme.primary,
                      ),
                    ),
                  );
                } else if (!snapshot.hasData ||
                    snapshot.data?.results == null) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "No data available",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Something Went Wrong",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                  );
                } else {
                  var popularMovies = snapshot.data!.results!
                      .map<PopularMoviesModel>((movieData) {
                    return PopularMoviesModel(
                      title: movieData.title ?? "No Title",
                      releaseDate: movieData.releaseDate ?? "Unknown Date",
                      imagePath: movieData.posterPath ?? "",
                    );
                  }).toList();
                  return Container(
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
                              final movie = popularMovies[index];
                              return PopularMovies(popularMoviesModel: movie);
                            },
                            itemCount: releaseMovie.length,
                          ),
                        )
                      ],
                    ),
                  );
                }
              }),
          Container(
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
                      return recommendedMovie[index];
                    },
                    itemCount: recommendedMovie.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
