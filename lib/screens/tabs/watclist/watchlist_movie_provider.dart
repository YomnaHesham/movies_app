import 'package:flutter/material.dart';
import 'package:movies/screens/tabs/watclist/watchlist_movie_model.dart';

class WatchlistProvider extends ChangeNotifier {
  final List<WatchlistMovieModel> _watchlist = [];

  List<WatchlistMovieModel> get watchlist => _watchlist;

  void addToWatchlist(WatchlistMovieModel movie) {
    if (!_watchlist.contains(movie)) {
      _watchlist.add(movie);
      notifyListeners();
    }
  }
}
