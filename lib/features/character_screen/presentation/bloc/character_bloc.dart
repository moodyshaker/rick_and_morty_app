import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/networking/api_error_model.dart';
import 'package:rick_and_morty_app/features/character_screen/domain/usecases/get_character_use_case.dart';
import 'package:rick_and_morty_app/features/character_screen/presentation/bloc/character_states.dart';

import '../../../../core/networking/api_result.dart';
import '../../domain/entity/character_entity.dart';

class CharacterCubit extends Cubit<CharacterStates> {
  final GetCharacterUseCase getCharacterUseCase;

  CharacterCubit(this.getCharacterUseCase) : super(CharacterInitState());

  TextEditingController characterNameController = TextEditingController();
  TextEditingController characterStatusController = TextEditingController();
  TextEditingController characterSpeciesController = TextEditingController();

  int page = 1;
  List<Character> characters = [];

  void getCharacterData() async {
    emit(CharacterLoadingState());
    ApiResult<CharacterEntity> characterEntity = await getCharacterUseCase(
      page,
      characterStatus: characterStatusController.text,
      characterSpecies: characterSpeciesController.text,
      characterName: characterNameController.text,
    );
    characterEntity.when(success: (CharacterEntity entity) {
      characters = entity.characterList ?? [];
      emit(CharacterSuccessState(characters));
    }, failure: (ApiErrorModel error) {
      emit(CharacterErrorState(error));
    });
  }
}
