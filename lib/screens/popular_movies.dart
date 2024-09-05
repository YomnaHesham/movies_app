import 'package:flutter/material.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/movie_item.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Popular Movies");
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.40,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
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
                  width: MediaQuery.of(context).size.width * 0.60,
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dora and the Lost City of Gold',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '2019 PG-13 2h 7m',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 24,
              left: 20,
              child: MovieItem(
                width: 129,
                height: 199,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
