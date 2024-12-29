import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../../../../core/networking/api_constants.dart';
import '../../model/character_response_model.dart';

part 'character_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class CharacterApiService {
  factory CharacterApiService(Dio dio, {String baseUrl}) = _CharacterApiService;

  @GET(ApiConstants.character)
  Future<CharacterResponseModel> charactersListData(
      @Query('name') String? characterName,
      @Query('status') String? characterStatus,
      @Query('species') String? characterSpecies,
      @Query('page') int currentPage);
}
