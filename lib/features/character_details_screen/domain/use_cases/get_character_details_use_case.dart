import 'package:rick_and_morty_app/core/networking/api_result.dart';
import 'package:rick_and_morty_app/features/character_details_screen/domain/entity/character_details_entity.dart';
import 'package:rick_and_morty_app/features/character_screen/domain/base_character_repository/base_character_repository.dart';

import '../base_character_detials_repository/base_character_details_repository.dart';

class GetCharacterDetailsUseCase {
  final BaseCharacterDetailsRepository repository;

  GetCharacterDetailsUseCase(this.repository);

  Future<ApiResult<CharacterDetailsEntity>> call(int id) =>
      repository.getCharacterDetails(id);
}
