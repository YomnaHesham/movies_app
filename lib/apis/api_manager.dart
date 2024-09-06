import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/models/popular_response.dart';

class ApiManager {
  static Future<PopularResponse> getPopular() async {
    //https://api.themoviedb.org/3/movie/popular?language=en-US&page=1&Authorization=Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYjE0YzY5YTI1YmFkYzkyOTk0YjVkMTNiMTg0YWNkZSIsIm5iZiI6MTcyNTU3MjE1MS4yODE4MjEsInN1YiI6IjY2ZDczNmFkNzdmZWQzYWViM2I4MjYzZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AeEkyVZODp1AeKIfHeTrjNJ8c4u8TBj6qbFGHfjqDgI
    Uri url = Uri.https("api.themoviedb.org", "/3/movie/popular", {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYjE0YzY5YTI1YmFkYzkyOTk0YjVkMTNiMTg0YWNkZSIsIm5iZiI6MTcyNTU3MjE1MS4yODE4MjEsInN1YiI6IjY2ZDczNmFkNzdmZWQzYWViM2I4MjYzZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AeEkyVZODp1AeKIfHeTrjNJ8c4u8TBj6qbFGHfjqDgI",
    });

    http.Response response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1'),
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYjE0YzY5YTI1YmFkYzkyOTk0YjVkMTNiMTg0YWNkZSIsIm5iZiI6MTcyNTU3MjE1MS4yODE4MjEsInN1YiI6IjY2ZDczNmFkNzdmZWQzYWViM2I4MjYzZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AeEkyVZODp1AeKIfHeTrjNJ8c4u8TBj6qbFGHfjqDgI',
        // Use Authorization Header
      },
    );

    Map<String, dynamic> jsonFormat = jsonDecode(response.body);

    return PopularResponse.fromJson(jsonFormat);
  }
}
