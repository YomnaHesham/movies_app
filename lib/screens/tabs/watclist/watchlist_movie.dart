import 'package:flutter/material.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/widgets/recommended_model.dart';

class WatchlistMovie extends StatelessWidget {
  RecommendedModel recommendedModel;

  WatchlistMovie({required this.recommendedModel, super.key});

  @override
  Widget build(BuildContext context) {
    String posterUrl =
        'https://image.tmdb.org/t/p/w500${recommendedModel.imagePath}';

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                height: 90,
                width: 140,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    posterUrl,
                    width: 140,
                    height: 90,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recommendedModel.title,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      recommendedModel.releasedDate,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: AppTheme.white,
                          ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 24,
                          color: AppTheme.primary,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          recommendedModel.rate.toString(),
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: AppTheme.white,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: AppTheme.line,
          thickness: 1,
        ),
      ],
    );
  }
}
