import 'package:rick_and_morty_app/core/networking/api_result.dart';
import 'package:rick_and_morty_app/features/favourite_screen/data/model/favourite_character_model.dart';

abstract class BaseFavouriteCharacterRepository{
  Future<ApiResult<List<FavouriteCharacterModel>>> getAllFavourites();
  Future<ApiResult<bool>> deleteFromFavourite(int id);
}