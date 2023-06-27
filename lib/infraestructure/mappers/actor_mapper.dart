import 'package:cinemapedia/infraestructure/models/moviedb/credits_response.dart';

import '../../domain/entities/actor.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
        id: cast.id,
        name: cast.name,
        profilePath: cast.profilePath == null
            ? 'https://www.seekpng.com/png/detail/202-2024994_profile-icon-profile-logo-no-background.png'
            : 'https://image.tmdb.org/t/p/w500${cast.profilePath}',
        character: cast.character,
      );
}
