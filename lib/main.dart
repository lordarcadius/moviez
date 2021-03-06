import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:moviez/data/core/api_client.dart';
import 'package:moviez/data/data_sources/movie_remote_data_source.dart';
import 'package:moviez/data/repositories/movie_repository_impl.dart';
import 'package:moviez/domain/entities/app_error.dart';
import 'package:moviez/domain/entities/movie_entity.dart';
import 'package:moviez/domain/repositories/movie_repository.dart';
import 'package:moviez/domain/usecases/get_trending.dart';
import 'package:moviez/presentation/journeys/home_page.dart';

Future<void> main() async {
  ApiClient apiClient = ApiClient(Client());
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(apiClient);
  MovieRepository movieRepository = MovieRepositoryImpl(dataSource);
  GetTrending getTrending = GetTrending(movieRepository);
  final Either<AppError, List<MovieEntity>> eitherResponse =
      await getTrending();
  eitherResponse.fold((l) {
    print('error');
    print(l);
  }, (r) {
    print('list of movies');
    print(r);
  });
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
