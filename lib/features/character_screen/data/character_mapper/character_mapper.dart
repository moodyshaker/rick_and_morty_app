import 'package:rick_and_morty_app/features/character_screen/data/model/character_response_model.dart';
import 'package:rick_and_morty_app/features/character_screen/domain/entity/character_entity.dart';

class CharacterMapper {
  CharacterMapper._();

  static CharacterEntity mapCharacterModelToEntity(
          CharacterResponseModel characterModel) =>
      CharacterEntity(
          info: CharacterEntityInfo(
            count: characterModel.info?.count,
            pages: characterModel.info?.pages,
          ),
          characterList: characterModel.characterList
              ?.map((e) => Character(
                    name: e.name ?? '',
                    id: e.id ?? 0,
                    species: e.species ?? '',
                    status: e.status ?? '',
                    image: e.image ?? '',
                    gender: e.gender ?? '',
                  ))
              .toList());
}
