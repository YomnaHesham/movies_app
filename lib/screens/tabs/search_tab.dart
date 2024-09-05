import 'package:flutter/material.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/screens/watchlist_movie.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 24,
                  color: AppTheme.grayBody,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide(
                  color: AppTheme.grayBody,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide(
                  color: AppTheme.grayBody,
                  width: 1,
                ),
              ),
              fillColor: AppTheme.search,
              filled: true,
              labelText: 'Search',
              labelStyle: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: AppTheme.grayBody),
            ),
          ),
          // Expanded(
          //   child: Center(
          //     child: Image.asset("assets/images/no_movies.png"),
          //   ),
          // ),
          const WatchlistMovie(),
        ],
      ),
    );
  }
}
