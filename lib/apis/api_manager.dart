import 'dart:convert';

import 'package:http/http.dart' as http;
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
    Uri url =
        Uri.parse('api.themoviedb.org/3/movie/top_rated?language=en-US&page=1');

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
}
