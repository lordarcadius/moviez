import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:moviez/data/core/api_client.dart';
import 'package:moviez/data/data_sources/movie_remote_data_source.dart';
import 'package:moviez/presentation/journeys/home_page.dart';

void main() {
  ApiClient apiClient = ApiClient(Client());
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(apiClient);
  dataSource.getTrending();
  dataSource.getPopular();

  runApp(Moviez());
}

final String appName = 'Moviez';

class Moviez extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
    );
  }
}
