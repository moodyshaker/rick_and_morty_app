import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/core/networking/api_error_model.dart';
import 'package:rick_and_morty_app/core/networking/api_result.dart';
import 'package:rick_and_morty_app/features/character_screen/data/character_mapper/character_mapper.dart';
import 'package:rick_and_morty_app/features/character_screen/data/data_source/remote_data_source/character_remote_data_source.dart';
import 'package:rick_and_morty_app/features/character_screen/data/model/character_response_model.dart';
import 'package:rick_and_morty_app/features/character_screen/domain/base_character_repository/base_character_repository.dart';

import '../../../../core/networking/network_checker.dart';
import '../../domain/entity/character_entity.dart';

class CharacterRepository extends BaseCharacterRepository {
  final CharacterApiService characterApiService;
  final NetworkChecker networkChecker;

  CharacterRepository(this.characterApiService, this.networkChecker);

  @override
  Future<ApiResult<CharacterEntity>> getCharacterListData(int page,
      {String? characterName,
      String? characterStatus,
      String? characterSpecies}) async {
    bool isConnected = await networkChecker.isConnected;
    if (isConnected) {
      try {
        CharacterResponseModel characterResponseModel =
            await characterApiService.charactersListData(
                characterName, characterStatus, characterSpecies, page);
        CharacterEntity entity =
            CharacterMapper.mapCharacterModelToEntity(characterResponseModel);
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