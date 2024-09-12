import 'package:flutter/material.dart';
import 'package:movies/widgets/recommended_model.dart';

class WatchlistProvider extends ChangeNotifier {
  final List<RecommendedModel> _watchlist = [];

  List<RecommendedModel> get watchlist => _watchlist;

  void addToWatchlist(RecommendedModel movie) {
    if (!_watchlist.contains(movie)) {
      _watchlist.add(movie);
      notifyListeners();
    }
  }

  void removeFromWatchlist(RecommendedModel movie) {
    if (_watchlist.contains(movie)) {
      _watchlist.remove(movie);
      notifyListeners();
    }
  }
}
