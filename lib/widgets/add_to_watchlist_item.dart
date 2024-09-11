import 'package:flutter/material.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/screens/tabs/watclist/watchlist_movie_model.dart';
import 'package:movies/screens/tabs/watclist/watchlist_movie_provider.dart';
import 'package:movies/widgets/movie_item_model.dart';
import 'package:provider/provider.dart';

class AddToWatchlistItem extends StatefulWidget {
  final WatchlistMovieModel movie;

  const AddToWatchlistItem({required this.movie, super.key});

  @override
  State<AddToWatchlistItem> createState() => _AddToWatchlistItemState();
}

class _AddToWatchlistItemState extends State<AddToWatchlistItem> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    var watchlistProvider = Provider.of<WatchlistProvider>(context);

    return InkWell(
      onTap: () {
        setState(() {
          isAdded = !isAdded;
        });

        if (isAdded) {
          watchlistProvider.addToWatchlist(widget.movie);
        }
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 8),
            width: 32,
            decoration: BoxDecoration(
              color: !isAdded ? Colors.grey.withOpacity(0.8) : AppTheme.primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
            ),
            child: Center(
              child: Icon(
                !isAdded ? Icons.add : Icons.done,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
          ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              width: 32,
              padding: const EdgeInsets.all(8),
              color: !isAdded ? Colors.grey.withOpacity(0.8) : AppTheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(0, size.height);
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width / 2, size.height / 2);
    path.lineTo(0, size.height);
    path.moveTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
