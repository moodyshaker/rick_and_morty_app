import 'package:rick_and_morty_app/features/favourite_screen/data/model/favourite_character_model.dart';
import 'package:rick_and_morty_app/features/favourite_screen/domain/base_favourite_characters_repository/base_favourite_characters_repository.dart';

import '../../../../core/networking/api_result.dart';

class GetAllFavouriteCharactersUseCase {
  final BaseFavouriteCharacterRepository repository;

  GetAllFavouriteCharactersUseCase(this.repository);

  Future<ApiResult<List<FavouriteCharacterModel>>> call() =>
      repository.getAllFavourites();
}
