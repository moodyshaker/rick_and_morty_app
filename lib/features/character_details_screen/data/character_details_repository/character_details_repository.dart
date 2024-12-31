import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/core/networking/api_result.dart';
import 'package:rick_and_morty_app/features/character_details_screen/data/data_source/remote_data_source/character_details_remote_data_source.dart';
import 'package:rick_and_morty_app/features/character_details_screen/data/model/character_details_response_model.dart';
import 'package:rick_and_morty_app/features/character_details_screen/domain/base_character_detials_repository/base_character_details_repository.dart';
import 'package:rick_and_morty_app/features/character_details_screen/domain/entity/character_details_entity.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/network_checker.dart';
import '../character_details_mapper/character_details_mapper.dart';

class CharacterDetailsRepository extends BaseCharacterDetailsRepository {
  final CharacterDetailsApiService characterDetailsApiService;
  final NetworkChecker networkChecker;

  CharacterDetailsRepository(
      this.characterDetailsApiService, this.networkChecker);

  @override
  Future<ApiResult<CharacterDetailsEntity>> getCharacterDetails(int id) async {
    bool isConnected = await networkChecker.isConnected;
    if (isConnected) {
      try {
        CharacterDetailsResponseModel characterDetailsResponseModel =
            await characterDetailsApiService.characterDetailsData(id);
        CharacterDetailsEntity entity =
            CharacterDetailsMapper.mapCharacterDetailsModelToEntity(characterDetailsResponseModel);
        return ApiResult.success(entity);
      } on DioException catch (e) {
        return ApiResult.failure(ApiErrorModel(
            error: e.response?.data['message'] ??
                e.response?.data['error'] ??
                e.message ??
                e.error.toString()));
      }
    } else {
      return ApiResult.failure(ApiErrorModel(
          error: 'Please Check Your Internet Connection',
          isNetworkConnectionError: true));
    }
  }
}
