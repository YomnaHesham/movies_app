import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/movie_card.dart';
import 'package:movies/movie_item.dart';
import 'package:movies/screens/popular_movies.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int currentIndex = 0;

  List<MovieItem> releaseMovie = [
    MovieItem(width: 96, height: 127),
    MovieItem(width: 96, height: 127),
    MovieItem(width: 96, height: 127),
    MovieItem(width: 96, height: 127),
    MovieItem(width: 96, height: 127),
    MovieItem(width: 96, height: 127),
    MovieItem(width: 96, height: 127),
    MovieItem(width: 96, height: 127),
  ];

  List<MovieCard> recommendedMovie = [
    const MovieCard(),
    const MovieCard(),
    const MovieCard(),
    const MovieCard(),
    const MovieCard(),
  ];

  List<PopularMovies> popularMovies = [
    const PopularMovies(),
    const PopularMovies(),
    const PopularMovies(),
    const PopularMovies(),
    const PopularMovies(),
    const PopularMovies(),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PopularMovies(),
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.40,
          //   width: double.infinity,
          //   child: CarouselSlider(
          //     options: CarouselOptions(
          //       autoPlay: false,
          //       enlargeCenterPage: true,
          //       onPageChanged: (index, reason) {
          //         setState(() {
          //           currentIndex = index;
          //         });
          //       },
          //     ),
          //     items: popularMovies,
          //   ),
          // ),
          Container(
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
                      return releaseMovie[index];
                    },
                    itemCount: releaseMovie.length,
                  ),
                )
              ],
            ),
          ),
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
