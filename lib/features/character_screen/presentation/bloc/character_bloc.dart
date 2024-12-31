import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/networking/api_error_model.dart';
import 'package:rick_and_morty_app/core/widgets/app_snack_bar.dart';
import 'package:rick_and_morty_app/features/character_screen/data/model/character_response_model.dart';
import 'package:rick_and_morty_app/features/character_screen/domain/usecases/add_to_favourite.dart';
import 'package:rick_and_morty_app/features/character_screen/domain/usecases/delete_from_favourite.dart';
import 'package:rick_and_morty_app/features/character_screen/domain/usecases/get_character_use_case.dart';
import 'package:rick_and_morty_app/features/character_screen/domain/usecases/is_favourite_character.dart';
import 'package:rick_and_morty_app/features/character_screen/presentation/bloc/character_states.dart';
import 'package:rick_and_morty_app/features/favourite_screen/data/model/favourite_character_model.dart';

import '../../../../core/networking/api_result.dart';
import '../../domain/entity/character_entity.dart';

class CharacterCubit extends Cubit<CharacterStates> {
  final GetCharacterUseCase getCharacters;
  final CharacterIsFavouriteCharacterUseCase isFavouriteCharacter;
  final CharacterDeleteFromFavouriteUseCase deleteFromFavourite;
  final CharacterAddToFavouriteUseCase addToFavourite;

  CharacterCubit({
    required this.getCharacters,
    required this.addToFavourite,
    required this.deleteFromFavourite,
    required this.isFavouriteCharacter,
  }) : super(CharacterInitState());

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
    ApiResult<CharacterEntity> characterEntity = await getCharacters(
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
    ApiResult<CharacterEntity> characterEntity = await getCharacters(
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
      ApiResult<CharacterEntity> characterEntity = await getCharacters(
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

  Future<bool> isFavourite(int id) async {
    ApiResult<bool> isFavourite = await isFavouriteCharacter(id);
    bool fav = false;
    isFavourite.when(success: (bool isFavourite) {
      if (isFavourite) {
        fav = true;
      } else {
        fav = false;
      }
    }, failure: (ApiErrorModel error) {
      showSnackBar(error.error);
      fav = false;
    });
    return fav;
  }

  void addItemToFavourite(Character model) async {
    ApiResult<bool> addedToFavourite = await addToFavourite(FavouriteCharacterModel(
        id: model.id!,
        name: model.name!,
        status: model.status!,
        species: model.species!,
        image: model.image!,
        gender: model.gender!));
    addedToFavourite.when(success: (bool addedToFavourite) {
      if (addedToFavourite) {
        emit(CharacterSuccessState(characters));
        showSnackBar('Item Added To Favourite Successfully');
      } else {
        emit(CharacterSuccessState(characters));
        showSnackBar('There is an error while adding this item');
      }
    }, failure: (ApiErrorModel error) {
      emit(CharacterSuccessState(characters));
      showSnackBar(error.error);
    });
  }

  void deleteFromFavourites(int id) async {
    ApiResult<bool> deleted = await deleteFromFavourite(id);
    deleted.when(success: (bool deleted) {
      if (deleted) {
        emit(CharacterSuccessState(characters));
        showSnackBar('Item Deleted Successfully');
      } else {
        emit(CharacterSuccessState(characters));
        showSnackBar('There is an error while deleting this item');
      }
    }, failure: (ApiErrorModel error) {
      emit(CharacterSuccessState(characters));
      showSnackBar(error.error);
    });
  }
}
