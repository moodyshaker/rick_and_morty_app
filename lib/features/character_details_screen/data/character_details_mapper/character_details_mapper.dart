import 'package:rick_and_morty_app/features/character_screen/data/model/character_response_model.dart';
import 'package:rick_and_morty_app/features/character_screen/domain/entity/character_entity.dart';

import '../../domain/entity/character_details_entity.dart';
import '../model/character_details_response_model.dart';

class CharacterDetailsMapper {
  CharacterDetailsMapper._();

  static CharacterDetailsEntity mapCharacterDetailsModelToEntity(
          CharacterDetailsResponseModel characterDetailsModel) =>
      CharacterDetailsEntity(
        id: characterDetailsModel.id ?? 0,
        name: characterDetailsModel.name ?? '',
        status: characterDetailsModel.status ?? '',
        species: characterDetailsModel.species ?? '',
        type: characterDetailsModel.type ?? '',
        gender: characterDetailsModel.gender ?? '',
        origin: CharacterDetailsOriginEntity(
            name: characterDetailsModel.origin?.name ?? '',
            url: characterDetailsModel.origin?.url ?? ''),
        location: CharacterDetailsOriginEntity(
            name: characterDetailsModel.location?.name ?? '',
            url: characterDetailsModel.location?.url ?? ''),
        image: characterDetailsModel.image ?? '',
        listOfEpisodes: characterDetailsModel.listOfEpisodes ?? [],
      );
}
