import 'package:rick_and_morty_app/core/networking/api_result.dart';
import 'package:rick_and_morty_app/features/character_screen/data/character_repository/character_repository.dart';
import 'package:rick_and_morty_app/features/character_screen/domain/entity/character_entity.dart';

class GetCharacterUseCase {
  final CharacterRepository repository;

  GetCharacterUseCase(this.repository);

  Future<ApiResult<CharacterEntity>> call(
    int page, {
    String? characterName,
    String? characterStatus,
    String? characterSpecies,
  }) =>
      repository.getCharacterListData(page,
          characterName: characterName,
          characterSpecies: characterSpecies,
          characterStatus: characterStatus);
}
