import 'package:rick_and_morty_app/core/networking/api_error_model.dart';
import 'package:rick_and_morty_app/features/character_details_screen/domain/entity/character_details_entity.dart';

sealed class CharacterDetailsStates {}

class CharacterDetailsInitState extends CharacterDetailsStates {}

class CharacterDetailsLoadingState extends CharacterDetailsStates {}

class CharacterDetailsSuccessState extends CharacterDetailsStates {
  final CharacterDetailsEntity characterEntity;

  CharacterDetailsSuccessState(this.characterEntity);
}

class CharacterDetailsErrorState extends CharacterDetailsStates {
  final ApiErrorModel apiErrorModel;

  CharacterDetailsErrorState(this.apiErrorModel);
}
