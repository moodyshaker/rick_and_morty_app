import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/networking/api_error_model.dart';
import 'package:rick_and_morty_app/features/character_details_screen/domain/use_cases/get_character_details_use_case.dart';
import 'package:rick_and_morty_app/features/character_details_screen/presentation/bloc/character_details_states.dart';

import '../../../../core/networking/api_result.dart';
import '../../domain/entity/character_details_entity.dart';

class CharacterDetailsCubit extends Cubit<CharacterDetailsStates> {
  final GetCharacterDetailsUseCase useCase;

  CharacterDetailsCubit(this.useCase) : super(CharacterDetailsInitState());

  void getCharacterDetailsData(int id) async {
    emit(CharacterDetailsLoadingState());
    ApiResult<CharacterDetailsEntity> characterData = await useCase(id);
    characterData.when(success: (CharacterDetailsEntity entity) {
      emit(CharacterDetailsSuccessState(entity));
    }, failure: (ApiErrorModel error) {
      emit(CharacterDetailsErrorState(error));
    });
  }
}
