import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:dio/dio.dart';

import '../../config/constants/enviromment.dart';
import '../mappers/actor_mapper.dart';
import '../models/moviedb/credits_response.dart';

class ActorMovieDbDatasource implements ActorsDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
      queryParameters: {
        'api_key': Enviroment.theMovieDbKey,
        'language': 'es-MX',
      },
    ),
  );

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('movie/$movieId/credits');
    print('getActorsByMovie=> ${response.realUri}');
    if (response.statusCode != 200) {
      throw Exception('Actors from Movie with id: $movieId not found');
    }
    final creditsResponse = CreditsResponse.fromJson(response.data);

    final List<Actor> actors = creditsResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();
    return actors;
  }
}
