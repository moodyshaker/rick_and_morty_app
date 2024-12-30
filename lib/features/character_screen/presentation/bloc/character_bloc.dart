import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/networking/api_error_model.dart';
import 'package:rick_and_morty_app/core/widgets/app_snack_bar.dart';
import 'package:rick_and_morty_app/features/character_screen/domain/usecases/get_character_use_case.dart';
import 'package:rick_and_morty_app/features/character_screen/presentation/bloc/character_states.dart';

import '../../../../core/networking/api_result.dart';
import '../../domain/entity/character_entity.dart';

class CharacterCubit extends Cubit<CharacterStates> {
  final GetCharacterUseCase useCase;

  CharacterCubit(this.useCase) : super(CharacterInitState());

  TextEditingController characterNameController = TextEditingController();
  TextEditingController characterStatusController = TextEditingController();
  TextEditingController characterSpeciesController = TextEditingController();

  void clearControllers() {
    characterNameController.clear();
    characterStatusController.clear();
    characterSpeciesController.clear();
  }

  int page = 1;
  List<Character> characters = [];
  CharacterEntityInfo? pageInfo;

  void reloadCharacterData() async {
    page = 1;
    characters = [];
    clearControllers();
    emit(CharacterLoadingState());
    ApiResult<CharacterEntity> characterEntity = await useCase(
      page,
      characterStatus: characterStatusController.text,
      characterSpecies: characterSpeciesController.text,
      characterName: characterNameController.text,
    );
    characterEntity.when(success: (CharacterEntity entity) {
      characters = entity.characterList ?? [];
      pageInfo = entity.info;
      emit(CharacterSuccessState(characters));
    }, failure: (ApiErrorModel error) {
      emit(CharacterErrorState(error));
    });
  }

  void getCharacterData() async {
    page = 1;
    characters = [];
    emit(CharacterLoadingState());
    ApiResult<CharacterEntity> characterEntity = await useCase(
      page,
      characterStatus: characterStatusController.text,
      characterSpecies: characterSpeciesController.text,
      characterName: characterNameController.text,
    );
    characterEntity.when(success: (CharacterEntity entity) {
      characters = entity.characterList ?? [];
      pageInfo = entity.info;
      emit(CharacterSuccessState(characters));
    }, failure: (ApiErrorModel error) {
      emit(CharacterErrorState(error));
    });
  }

  void pagingCharacterData() async {
    if (pageInfo != null && (page < pageInfo!.pages!.toInt())) {
      page++;
      emit(CharacterSuccessState(characters, isPaging: true));
      ApiResult<CharacterEntity> characterEntity = await useCase(
        page,
        characterStatus: characterStatusController.text,
        characterSpecies: characterSpeciesController.text,
        characterName: characterNameController.text,
      );
      characterEntity.when(success: (CharacterEntity entity) {
        characters.addAll(entity.characterList ?? []);
        pageInfo == entity.info;
        emit(CharacterSuccessState(characters, isPaging: false));
      }, failure: (ApiErrorModel error) {
        page--;
        showSnackBar(error.error);
        emit(CharacterSuccessState(characters, isPaging: false));
      });
    } else {
      showSnackBar('There is no Page Number ${page + 1}');
    }
  }
}
