import '../../../../core/networking/api_result.dart';
import '../../../favourite_screen/data/model/favourite_character_model.dart';
import '../../data/model/character_response_model.dart';
import '../entity/character_entity.dart';

abstract class BaseCharacterRepository {
  Future<ApiResult<CharacterEntity>> getCharacterListData(int page,
      {String? characterName,
      String? characterStatus,
      String? characterSpecies});

  Future<ApiResult<bool>> addToFavourite(FavouriteCharacterModel model);

  Future<ApiResult<bool>> isFavourite(int id);

  Future<ApiResult<bool>> deleteFromFavourite(int id);
}
