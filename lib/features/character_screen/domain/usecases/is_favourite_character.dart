import 'package:rick_and_morty_app/features/character_screen/domain/base_character_repository/base_character_repository.dart';
import '../../../../core/networking/api_result.dart';

class CharacterIsFavouriteCharacterUseCase {
  final BaseCharacterRepository repository;

  CharacterIsFavouriteCharacterUseCase(this.repository);

  Future<ApiResult<bool>> call(int id) => repository.isFavourite(id);
}
