import 'package:flutter/material.dart';
import 'package:movies/screens/tabs/watclist/watchlist_movie.dart';
import 'package:movies/screens/tabs/watclist/watchlist_movie_provider.dart';
import 'package:provider/provider.dart';

class WatchlistTab extends StatelessWidget {
  const WatchlistTab({super.key});

  @override
  Widget build(BuildContext context) {
    var watchlist = Provider.of<WatchlistProvider>(context).watchlist;

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
              child: watchlist.isEmpty
                  ? Center(
                      child: Text(
                        'No movies in your watchlist yet.',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    )
                  : ListView.builder(
                      itemCount: watchlist.length,
                      itemBuilder: (context, index) {
                        final movie = watchlist[index];
                        return WatchlistMovie(watchlistMovieModel: movie);
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
