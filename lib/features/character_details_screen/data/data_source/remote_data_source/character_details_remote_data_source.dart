import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../../../../core/networking/api_constants.dart';
import '../../model/character_details_response_model.dart';

part 'character_details_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class CharacterDetailsApiService {
  factory CharacterDetailsApiService(Dio dio, {String baseUrl}) = _CharacterDetailsApiService;

  @GET('${ApiConstants.character}/{id}')
  Future<CharacterDetailsResponseModel> characterDetailsData(@Path('id') int id);
}
