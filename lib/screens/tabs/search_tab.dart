import 'package:flutter/material.dart';
import 'package:movies/apis/api_manager.dart';
import 'package:movies/app_theme.dart';
import 'package:movies/models/search_response.dart';
import 'package:movies/screens/movie_details_screen.dart';
import 'package:movies/widgets/movie_item.dart';
import 'package:movies/widgets/movie_item_model.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final TextEditingController _searchController = TextEditingController();
  String _query = ''; // Store the search query
  Future<SearchResponse>? _searchResults;

  void _onSearch() {
    if (_searchController.text.isNotEmpty) {
      setState(() {
        _query = _searchController.text;
        _searchResults = ApiManager.getSearch(_query);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              prefixIcon: IconButton(
                onPressed: _onSearch,
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
            onSubmitted: (value) {
              _onSearch();
            },
          ),
          const SizedBox(
            height: 32,
          ),

          Expanded(
            child: FutureBuilder<SearchResponse>(
              future: _searchResults,
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
                      String imagePath =
                          'https://image.tmdb.org/t/p/w500${movie.posterPath ?? ""}';
                      String title = movie.title ?? "No Title";
                      String releaseDate = movie.releaseDate ?? "Unknown Date";
                      String rate =
                          movie.voteAverage?.toStringAsFixed(1) ?? "0.0";

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              MovieDetailsScreen.routName,
                              arguments: movie.id);
                        },
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: MovieItem(
                                    movieItemModel: MovieItemModel(
                                      width: 140,
                                      height: 90,
                                      imagePath: imagePath,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                      Text(
                                        releaseDate,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              color: AppTheme.white,
                                            ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.star,
                                              size: 16,
                                              color: AppTheme.primary),
                                          const SizedBox(width: 4),
                                          Text(rate),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            const Divider(
                              color: AppTheme.line,
                              thickness: 2,
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: movies.length,
                  );
                }
              },
            ),
          ),

          // WatchlistMovie(),
        ],
      ),
    );
  }
}
