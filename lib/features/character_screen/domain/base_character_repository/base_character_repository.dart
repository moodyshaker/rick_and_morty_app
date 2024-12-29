import '../../../../core/networking/api_result.dart';
import '../../data/model/character_response_model.dart';
import '../entity/character_entity.dart';

abstract class BaseCharacterRepository {
  Future<ApiResult<CharacterEntity>> getCharacterListData(
    int page, {
    String? characterName,
    String? characterStatus,
    String? characterSpecies,
  });
}
