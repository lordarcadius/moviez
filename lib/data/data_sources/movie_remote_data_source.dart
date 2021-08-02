import 'dart:convert';

import 'package:http/http.dart';
import 'package:moviez/data/models/movie_model.dart';
import 'package:moviez/data/models/movies_result_model.dart';
import '../core/api_constants.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  final Client _client;

  MovieRemoteDataSourceImpl(this._client);
  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get(
      Uri.parse(
          '${ApiConstants.BASE_URL}trending/movie/day?api_key=${ApiConstants.API_KEY}'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final movies = MoviesResultModel.fromJson(responseBody).movies;
      print(movies);
      return movies;
    } else {
      throw new Exception(response.reasonPhrase);
    }
  }
}
