import 'package:rick_and_morty_app/core/networking/api_result.dart';

import '../entity/character_details_entity.dart';

abstract class BaseCharacterDetailsRepository{
  Future<ApiResult<CharacterDetailsEntity>> getCharacterDetails(int id);
}