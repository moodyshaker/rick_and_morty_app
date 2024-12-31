import 'package:rick_and_morty_app/features/character_screen/domain/base_character_repository/base_character_repository.dart';
import 'package:rick_and_morty_app/features/favourite_screen/data/model/favourite_character_model.dart';
import 'package:rick_and_morty_app/features/favourite_screen/domain/base_favourite_characters_repository/base_favourite_characters_repository.dart';

import '../../../../core/networking/api_result.dart';

class CharacterDeleteFromFavouriteUseCase {
  final BaseCharacterRepository repository;

  CharacterDeleteFromFavouriteUseCase(this.repository);

  Future<ApiResult<bool>> call(int id) =>
      repository.deleteFromFavourite(id);
}
