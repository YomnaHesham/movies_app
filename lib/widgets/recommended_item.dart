import 'package:flutter/material.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/widgets/movie_item.dart';
import 'package:movies/widgets/movie_item_model.dart';
import 'package:movies/widgets/recommended_model.dart';

class RecommendedItem extends StatelessWidget {
  RecommendedModel recommendedModel;

  RecommendedItem({required this.recommendedModel, super.key});

  @override
  Widget build(BuildContext context) {
    String posterUrl =
        'https://image.tmdb.org/t/p/w500${recommendedModel.imagePath}';

    return Card(
      elevation: 16,
      color: AppTheme.grayBG,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MovieItem(
            movieItemModel:
                MovieItemModel(width: 129, height: 199, imagePath: posterUrl),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
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
                  recommendedModel.rate.toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              recommendedModel.title,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              recommendedModel.releasedDate,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: AppTheme.grayDate),
            ),
          ),
        ],
      ),
    );
  }
}
