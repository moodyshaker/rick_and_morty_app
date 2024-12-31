import 'package:rick_and_morty_app/core/networking/api_error_model.dart';
import 'package:rick_and_morty_app/core/networking/api_result.dart';
import 'package:rick_and_morty_app/features/favourite_screen/data/data_source/local_data_source/favourite_database.dart';
import 'package:rick_and_morty_app/features/favourite_screen/data/model/favourite_character_model.dart';
import 'package:rick_and_morty_app/features/favourite_screen/domain/base_favourite_characters_repository/base_favourite_characters_repository.dart';

class FavouriteCharactersRepository extends BaseFavouriteCharacterRepository {
  final FavouriteDataBase localDataBase;

  FavouriteCharactersRepository(this.localDataBase);
  @override
  Future<ApiResult<bool>> deleteFromFavourite(int id) async {
    try {
      bool deletedFromFavourite = await localDataBase.deleteFromFavourite(id);
      return ApiResult.success(deletedFromFavourite);
    } catch (e) {
      return ApiResult.failure(ApiErrorModel(error: e.toString()));
    }
  }

  @override
  Future<ApiResult<List<FavouriteCharacterModel>>> getAllFavourites() async {
    try {
      List<FavouriteCharacterModel> favourites =
          await localDataBase.getAllFavourites();
      return ApiResult.success(favourites);
    } catch (e) {
      return ApiResult.failure(ApiErrorModel(error: e.toString()));
    }
  }
}
