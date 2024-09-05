import 'package:flutter/material.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/movie_item.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Recommended Movies");
      },
      child: Card(
        elevation: 16,
        color: AppTheme.grayBG,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            MovieItem(width: 96, height: 127),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,top: 8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 18,
                    color: AppTheme.primary,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "7.7",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Deadpool 2",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "2018  R  1h 59m",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: AppTheme.grayDate),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
