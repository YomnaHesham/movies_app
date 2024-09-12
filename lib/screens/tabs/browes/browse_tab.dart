import 'package:flutter/material.dart';
import 'package:movies/apis/api_manager.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/screens/tabs/browes/browes_item.dart';
import 'package:movies/screens/tabs/browes/movies_category.dart';
import 'package:movies/widgets/error_indicator.dart';
import 'package:movies/widgets/not_available_indicator.dart';
import 'package:movies/widgets/waiting_indicator.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Browse Category ",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: FutureBuilder(
                  future: ApiManager.getGenreMovie(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const WaitingIndicator();
                    } else if (!snapshot.hasData ||
                        snapshot.data?.genres == null) {
                      return const NotAvailableIndicator();
                    } else if (snapshot.hasError) {
                      return const ErrorIndicator();
                    } else {
                      var genres = snapshot.data?.genres ?? [];
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 32,
                                crossAxisSpacing: 32),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  MoviesCategory.routName,
                                  arguments: genres[index].id);
                            },
                            child: BrowesItem(
                              title: genres[index].name ?? "",
                            ),
                          );
                        },
                        itemCount: genres.length,
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
