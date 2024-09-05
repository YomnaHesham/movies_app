import 'package:flutter/material.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/movie_card.dart';
import 'package:movies/movie_item.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.40,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          "assets/images/test.png",
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.25,
                          fit: BoxFit.cover,
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
                            'Dora and the Lost City of Gold',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '2019 PG-13 2h 7m',
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
                    width: 129,
                    height: 199,
                  ),
                ),
              ],
            ),
          ),
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
                        width: 12,
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
