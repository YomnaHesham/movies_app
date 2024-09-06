import 'package:flutter/material.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/movie_card.dart';
import 'package:movies/movie_item.dart';

class MovieDetailsScreen extends StatelessWidget {
  static const String routName = "movie_details";

  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.70,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        "assets/images/test.png",
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.25,
                        fit: BoxFit.cover,
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
                          'Dora and the Lost City of Gold',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          '2019 PG-13 2h 7m',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: MovieItem(
                                    width: double.infinity, height: 199,imagePath: "assets/images/test.png",)),
                            Container(
                              padding: const EdgeInsets.only(left: 12.0),
                              width: MediaQuery.of(context).size.width * 0.50,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  Text(
                                    "Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school.",
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                    softWrap: true,
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 32,
                                        color: AppTheme.primary,
                                      ),
                                      SizedBox(
                                        width: 14,
                                      ),
                                      Text(
                                        "7.7",
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
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              color: AppTheme.grayBG,
              padding: const EdgeInsets.all(24),
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
                        return MovieCard();
                      },
                      itemCount: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
