import 'package:flutter/material.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/movie_item.dart';

class WatchlistMovie extends StatelessWidget {
  const WatchlistMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 32,
          ),
          Row(
            children: [
              MovieItem(
                height: 89,
                width: 140,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Alita Battle Angel",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    "2019",
                    style:
                    Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppTheme.white,
                    ),
                  ),
                  Text(
                    "Rosa Salazar, Christoph Waltz",
                    style:
                    Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppTheme.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 14,
          ),
          Divider(
            color: AppTheme.line,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
