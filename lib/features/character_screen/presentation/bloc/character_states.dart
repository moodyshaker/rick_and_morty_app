import 'package:rick_and_morty_app/core/networking/api_error_model.dart';
import 'package:rick_and_morty_app/features/character_screen/domain/entity/character_entity.dart';

sealed class CharacterStates {}

class CharacterInitState extends CharacterStates {}

class CharacterLoadingState extends CharacterStates {}

class CharacterSuccessState extends CharacterStates {
  final bool isPaging;
  final List<Character> characterList;
  CharacterSuccessState(this.characterList, {this.isPaging = false});
}

class CharacterErrorState extends CharacterStates {
  final ApiErrorModel apiErrorModel;

  CharacterErrorState(this.apiErrorModel);
}
