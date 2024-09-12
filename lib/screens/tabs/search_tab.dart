import 'dart:async'; // Needed for the debounce functionality
import 'package:flutter/material.dart';
import 'package:movies/apis/api_manager.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/models/search_response.dart';
import 'package:movies/screens/movie_details_screen.dart';
import 'package:movies/screens/tabs/watclist/watchlist_movie.dart';
import 'package:movies/widgets/recommended_model.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final TextEditingController searchController = TextEditingController();
  String query = '';
  Future<SearchResponse>? searchResults;
  Timer? debounce;

  @override
  void initState() {
    super.initState();
    searchController.addListener(onSearchChanged);
  }

  @override
  void dispose() {
    searchController.removeListener(onSearchChanged);
    searchController.dispose();
    debounce?.cancel();
    super.dispose();
  }

  void onSearchChanged() {
    if (debounce?.isActive ?? false) {
      debounce?.cancel();
    }
    debounce = Timer(const Duration(milliseconds: 500), () {
      if (searchController.text.isEmpty) {
        setState(() {
          searchResults = null;
        });
      } else if (searchController.text.isNotEmpty) {
        setState(() {
          query = searchController.text;
          searchResults = ApiManager.getSearch(query);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          TextField(
            controller: searchController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: onSearchChanged,
                icon: const Icon(
                  Icons.search,
                  size: 24,
                  color: AppTheme.grayBody,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: const BorderSide(
                  color: AppTheme.grayBody,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: const BorderSide(
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
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: FutureBuilder<SearchResponse>(
              future: searchResults,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text("Error fetching data"));
                } else if (!snapshot.hasData ||
                    snapshot.data?.results == null) {
                  return Center(
                    child: Image.asset("assets/images/no_movies.png"),
                  );
                } else {
                  var movies = snapshot.data!.results ?? [];
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      var movie = movies[index];
                      String posterUrl =
                          'https://image.tmdb.org/t/p/w500${movie.posterPath ?? ""}';

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              MovieDetailsScreen.routName,
                              arguments: movie.id);
                        },
                        child: WatchlistMovie(
                          recommendedModel: RecommendedModel(
                              imagePath: posterUrl,
                              title: movie.title ?? "No Title",
                              releasedDate: movie.releaseDate ?? "Unknown Date",
                              rate: movie.voteAverage ?? 0),
                        ),
                      );
                    },
                    itemCount: movies.length,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
