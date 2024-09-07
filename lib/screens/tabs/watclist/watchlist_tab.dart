import 'package:flutter/material.dart';
import 'package:movies/screens/tabs/watclist/watchlist_movie.dart';

class WatchlistTab extends StatelessWidget {
  WatchlistTab({super.key});

  List<WatchlistMovie> watchMovies = [
    const WatchlistMovie(),
    const WatchlistMovie(),
    const WatchlistMovie(),
    const WatchlistMovie(),
    const WatchlistMovie(),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Watchlist",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return WatchlistMovie();
                  },
                  itemCount: 8,
                )),
          ),
        ],
      ),
    );
  }
}
