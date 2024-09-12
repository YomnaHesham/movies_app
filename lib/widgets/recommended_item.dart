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

    return SizedBox(
      width: 120,
      child: Card(
        shadowColor: AppTheme.blackBG,
        elevation: 16,
        color: AppTheme.grayBG,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              height: 127,
              child: MovieItem(
                movieItemModel: MovieItemModel(
                    width: 120, height: 127, imagePath: posterUrl),
                title: recommendedModel.title,
                date: recommendedModel.releasedDate,
                rate: recommendedModel.rate,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 18,
                    color: AppTheme.primary,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    recommendedModel.rate.toString().substring(0, 3),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
              child: Text(
                recommendedModel.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                softWrap: true,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 8.0),
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
      ),
    );
  }
}
