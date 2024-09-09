import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/models/genre_movie_response.dart';
import 'package:movies/models/likes_response.dart';
import 'package:movies/models/movie_category_response.dart';
import 'package:movies/models/movie_detailes_response.dart';
import 'package:movies/models/new_releases_response.dart';
import 'package:movies/models/popular_response.dart';
import 'package:movies/models/recommended_response.dart';

class ApiManager {
  static Future<PopularResponse> getPopular() async {
    // https://api.themoviedb.org/3/movie/popular?language=en-US&page=1&Authorization=Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYjE0YzY5YTI1YmFkYzkyOTk0YjVkMTNiMTg0YWNkZSIsIm5iZiI6MTcyNTU3MjE1MS4yODE4MjEsInN1YiI6IjY2ZDczNmFkNzdmZWQzYWViM2I4MjYzZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AeEkyVZODp1AeKIfHeTrjNJ8c4u8TBj6qbFGHfjqDgI
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1');

    http.Response response = await http.get(
      url,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYjE0YzY5YTI1YmFkYzkyOTk0YjVkMTNiMTg0YWNkZSIsIm5iZiI6MTcyNTU3MjE1MS4yODE4MjEsInN1YiI6IjY2ZDczNmFkNzdmZWQzYWViM2I4MjYzZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AeEkyVZODp1AeKIfHeTrjNJ8c4u8TBj6qbFGHfjqDgI',
      },
    );

    Map<String, dynamic> jsonFormat = jsonDecode(response.body);

    return PopularResponse.fromJson(jsonFormat);
  }

  static Future<NewReleasesResponse> getNewReleases() async {
    // https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1&Authorization= Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYjE0YzY5YTI1YmFkYzkyOTk0YjVkMTNiMTg0YWNkZSIsIm5iZiI6MTcyNTY2NzUzNS45NjQzNDQsInN1YiI6IjY2ZDczNmFkNzdmZWQzYWViM2I4MjYzZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.wnjFdfqKT50idtimwuwMkqPKaoo6hQcSlTb4boxWWDk
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1');

    http.Response response = await http.get(
      url,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYjE0YzY5YTI1YmFkYzkyOTk0YjVkMTNiMTg0YWNkZSIsIm5iZiI6MTcyNTY2NzUzNS45NjQzNDQsInN1YiI6IjY2ZDczNmFkNzdmZWQzYWViM2I4MjYzZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.wnjFdfqKT50idtimwuwMkqPKaoo6hQcSlTb4boxWWDk'
      },
    );

    Map<String, dynamic> jsonFormat = jsonDecode(response.body);

    return NewReleasesResponse.fromJson(jsonFormat);
  }

  static Future<RecommendedResponse> getRecommended() async {
    //  https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1&Authorization= Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYjE0YzY5YTI1YmFkYzkyOTk0YjVkMTNiMTg0YWNkZSIsIm5iZiI6MTcyNTY2NzUzNS45NjQzNDQsInN1YiI6IjY2ZDczNmFkNzdmZWQzYWViM2I4MjYzZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.wnjFdfqKT50idtimwuwMkqPKaoo6hQcSlTb4boxWWDk
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1');

    http.Response response = await http.get(
      url,
      headers: {
        'Authorization':
            ' Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYjE0YzY5YTI1YmFkYzkyOTk0YjVkMTNiMTg0YWNkZSIsIm5iZiI6MTcyNTY2NzUzNS45NjQzNDQsInN1YiI6IjY2ZDczNmFkNzdmZWQzYWViM2I4MjYzZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.wnjFdfqKT50idtimwuwMkqPKaoo6hQcSlTb4boxWWDk'
      },
    );

    Map<String, dynamic> jsonFormat = jsonDecode(response.body);

    return RecommendedResponse.fromJson(jsonFormat);
  }

  static Future<MovieDetailsResponse> getMovieDetails(int id) async {
    //https://api.themoviedb.org/3/movie/533535?language=en-US&Authorization=Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYjE0YzY5YTI1YmFkYzkyOTk0YjVkMTNiMTg0YWNkZSIsIm5iZiI6MTcyNTgyNzA5MC4yNDExMTgsInN1YiI6IjY2ZDczNmFkNzdmZWQzYWViM2I4MjYzZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xdNfdaANmuTrVpifsW6pz64H7ZM_XsIXtAO9ZSIyboY
    // id 533535
    Uri url =
        Uri.parse('https://api.themoviedb.org/3/movie/$id?language=en-US');

    http.Response response = await http.get(
      url,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYjE0YzY5YTI1YmFkYzkyOTk0YjVkMTNiMTg0YWNkZSIsIm5iZiI6MTcyNTgyNzA5MC4yNDExMTgsInN1YiI6IjY2ZDczNmFkNzdmZWQzYWViM2I4MjYzZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xdNfdaANmuTrVpifsW6pz64H7ZM_XsIXtAO9ZSIyboY'
      },
    );

    Map<String, dynamic> jsonFormat = jsonDecode(response.body);

    return MovieDetailsResponse.fromJson(jsonFormat);
  }

  static Future<LikesResponse> getLikes(int id) async {
    //https://api.themoviedb.org/3/movie/533535/similar?language=en-US&page=1&Authorization=Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYjE0YzY5YTI1YmFkYzkyOTk0YjVkMTNiMTg0YWNkZSIsIm5iZiI6MTcyNTgyNzA5MC4yNDExMTgsInN1YiI6IjY2ZDczNmFkNzdmZWQzYWViM2I4MjYzZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xdNfdaANmuTrVpifsW6pz64H7ZM_XsIXtAO9ZSIyboY
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/movie/$id/similar?language=en-US&page=1');

    http.Response response = await http.get(
      url,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYjE0YzY5YTI1YmFkYzkyOTk0YjVkMTNiMTg0YWNkZSIsIm5iZiI6MTcyNTgyNzA5MC4yNDExMTgsInN1YiI6IjY2ZDczNmFkNzdmZWQzYWViM2I4MjYzZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xdNfdaANmuTrVpifsW6pz64H7ZM_XsIXtAO9ZSIyboY'
      },
    );

    Map<String, dynamic> jsonFormat = jsonDecode(response.body);

    return LikesResponse.fromJson(jsonFormat);
  }

  static Future<MovieCategoryResponse> getMovieCategory(int id) async {
    //https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&Authorization=Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYjE0YzY5YTI1YmFkYzkyOTk0YjVkMTNiMTg0YWNkZSIsIm5iZiI6MTcyNTgyNzA5MC4yNDExMTgsInN1YiI6IjY2ZDczNmFkNzdmZWQzYWViM2I4MjYzZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xdNfdaANmuTrVpifsW6pz64H7ZM_XsIXtAO9ZSIyboY
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc');

    http.Response response = await http.get(
      url,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYjE0YzY5YTI1YmFkYzkyOTk0YjVkMTNiMTg0YWNkZSIsIm5iZiI6MTcyNTgyNzA5MC4yNDExMTgsInN1YiI6IjY2ZDczNmFkNzdmZWQzYWViM2I4MjYzZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xdNfdaANmuTrVpifsW6pz64H7ZM_XsIXtAO9ZSIyboY'
      },
    );

    Map<String, dynamic> jsonFormat = jsonDecode(response.body);

    return MovieCategoryResponse.fromJson(jsonFormat);
  }

  static Future<GenreMovieResponse> getGenreMovie() async {
//https://api.themoviedb.org/3/genre/movie/list?language=en&Authorization=Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYjE0YzY5YTI1YmFkYzkyOTk0YjVkMTNiMTg0YWNkZSIsIm5iZiI6MTcyNTgyNzA5MC4yNDExMTgsInN1YiI6IjY2ZDczNmFkNzdmZWQzYWViM2I4MjYzZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xdNfdaANmuTrVpifsW6pz64H7ZM_XsIXtAO9ZSIyboY
    Uri url =
        Uri.parse('https://api.themoviedb.org/3/genre/movie/list?language=en');

    http.Response response = await http.get(
      url,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYjE0YzY5YTI1YmFkYzkyOTk0YjVkMTNiMTg0YWNkZSIsIm5iZiI6MTcyNTgyNzA5MC4yNDExMTgsInN1YiI6IjY2ZDczNmFkNzdmZWQzYWViM2I4MjYzZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xdNfdaANmuTrVpifsW6pz64H7ZM_XsIXtAO9ZSIyboY'
      },
    );

    Map<String, dynamic> jsonFormat = jsonDecode(response.body);

    return GenreMovieResponse.fromJson(jsonFormat);
  }
}
