import 'package:flutter/material.dart';
import 'package:movies/apis/api_manager.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/screens/tabs/browes/movies_category.dart';
import 'package:movies/widgets/error_indicator.dart';
import 'package:movies/widgets/movie_item_model.dart';
import 'package:movies/widgets/not_available_indicator.dart';
import 'package:movies/widgets/recommended_item.dart';
import 'package:movies/widgets/movie_item.dart';
import 'package:movies/widgets/recommended_model.dart';
import 'package:movies/widgets/waiting_indicator.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routName = "movie_details";

  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieId = ModalRoute.of(context)!.settings.arguments as int;

    return FutureBuilder(
      future: ApiManager.getMovieDetails(movieId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const WaitingIndicator();
        } else if (!snapshot.hasData) {
          return const NotAvailableIndicator();
        } else if (snapshot.hasError) {
          return const ErrorIndicator();
        } else {
          var result = snapshot.data;
          String posterUrl =
              'https://image.tmdb.org/t/p/w500${result?.posterPath ?? ""}';
          var moviePoster = MovieItemModel(
            width: 129,
            height: 199,
            imagePath: posterUrl,
          );
          var category = result?.genres ?? [];

          return Scaffold(
            appBar: AppBar(
              title: Text(result?.title ?? "No Title"),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.70,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.network(
                              posterUrl,
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.25,
                              fit: BoxFit.fill,
                            ),
                            IconButton(
                              icon: const Icon(Icons.play_circle,
                                  size: 60, color: AppTheme.white),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                result?.title ?? "No Title",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                result?.releaseDate ?? "Unknown Date",
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Row(
                                children: [
                                  MovieItem(
                                    movieItemModel: moviePoster,
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 40,
                                          child: ListView.separated(
                                            separatorBuilder: (context, index) {
                                              return const SizedBox(
                                                width: 12,
                                              );
                                            },
                                            scrollDirection: Axis.horizontal,
                                            itemCount: category.length,
                                            itemBuilder: (context, index) {
                                              return ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                          MoviesCategory.routName,
                                                          arguments:
                                                              category[index]
                                                                  .id);
                                                  print(category[index]
                                                      .id);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    textStyle: Theme.of(context)
                                                        .textTheme
                                                        .headlineMedium,
                                                    backgroundColor:
                                                        AppTheme.blackBG,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      side: const BorderSide(
                                                          color:
                                                              AppTheme.search),
                                                    ),
                                                    foregroundColor:
                                                        AppTheme.grayBody),
                                                child: Text(
                                                    category[index].name ??
                                                        "No Category"),
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 14,
                                        ),
                                        Text(
                                          result?.overview ?? "No Description",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 5,
                                          softWrap: true,
                                        ),
                                        const SizedBox(
                                          height: 14,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              size: 32,
                                              color: AppTheme.primary,
                                            ),
                                            const SizedBox(
                                              width: 14,
                                            ),
                                            Text(
                                              result?.voteAverage
                                                      .toString()
                                                      .substring(0, 3) ??
                                                  "Unknown Rate",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            ),
                                          ],
                                        ),
                                      ],
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
                  FutureBuilder(
                    future: ApiManager.getLikes(movieId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const WaitingIndicator();
                      } else if (!snapshot.hasData ||
                          snapshot.data?.results == null) {
                        return const NotAvailableIndicator();
                      } else if (snapshot.hasError) {
                        return const ErrorIndicator();
                      } else {
                        var moreLike = snapshot.data!.results!
                            .map<RecommendedModel>((likes) {
                          return RecommendedModel(
                            title: likes.title ?? "No Title ",
                            releasedDate: likes.releaseDate ?? "Unknown Date",
                            rate: likes.voteAverage ?? 0,
                            imagePath: likes.posterPath ?? "",
                          );
                        }).toList();

                        return Container(
                          height: MediaQuery.of(context).size.height * 0.40,
                          width: double.infinity,
                          color: AppTheme.grayBG,
                          padding: const EdgeInsets.all(24),
                          margin: const EdgeInsets.only(bottom: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "More Like This",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Expanded(
                                child: ListView.separated(
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      width: 8,
                                    );
                                  },
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final recommendedMovie = moreLike[index];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                          MovieDetailsScreen.routName,
                                          arguments:
                                              snapshot.data?.results?[index].id,
                                        );
                                      },
                                      child: RecommendedItem(
                                        recommendedModel: recommendedMovie,
                                      ),
                                    );
                                  },
                                  itemCount: moreLike.length,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
