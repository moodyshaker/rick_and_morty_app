import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/core/networking/api_error_model.dart';
import 'package:rick_and_morty_app/core/networking/api_result.dart';
import 'package:rick_and_morty_app/core/widgets/app_snack_bar.dart';
import 'package:rick_and_morty_app/features/favourite_screen/data/model/favourite_character_model.dart';
import 'package:rick_and_morty_app/features/character_screen/domain/usecases/add_to_favourite.dart';
import 'package:rick_and_morty_app/features/favourite_screen/domain/use_cases/delete_from_favourite.dart';
import 'package:rick_and_morty_app/features/favourite_screen/domain/use_cases/get_all_favourite_characters.dart';
import 'package:rick_and_morty_app/features/character_screen/domain/usecases/is_favourite_character.dart';
import 'package:rick_and_morty_app/features/favourite_screen/presentation/bloc/favourite_states.dart';

class FavouriteCharactersCubit extends Cubit<FavouriteCharactersStates> {
  final GetAllFavouriteCharactersUseCase getAllFavouriteCharacters;
  final FavouriteDeleteFromFavouriteUseCase deleteFromFavourite;

  FavouriteCharactersCubit({
    required this.getAllFavouriteCharacters,
    required this.deleteFromFavourite,
  }) : super(FavouriteCharactersInitState());

  List<FavouriteCharacterModel> favouriteCharacters = [];

  void allFavouriteCharacters() async {
    emit(FavouriteCharactersLoadingState());
    ApiResult<List<FavouriteCharacterModel>> favourites =
        await getAllFavouriteCharacters();
    favourites.when(success: (List<FavouriteCharacterModel> favourites) {
      favouriteCharacters = favourites;
      emit(FavouriteCharactersSuccessState(favouriteCharacters));
    }, failure: (ApiErrorModel error) {
      emit(FavouriteCharactersErrorState(error));
    });
  }

  void deleteFromFavourites(int id) async {
    ApiResult<bool> deleted = await deleteFromFavourite(id);
    deleted.when(success: (bool deleted) {
      if (deleted) {
        log('id -> $id');
        log('favourites -> ${favouriteCharacters.length}');
        favouriteCharacters.removeWhere((FavouriteCharacterModel model) => model.id == id);
        emit(FavouriteCharactersSuccessState(favouriteCharacters));
        showSnackBar('Item Deleted Successfully');
      }else{
        emit(FavouriteCharactersSuccessState(favouriteCharacters));
        showSnackBar('There is an error while deleting this item');
      }
    }, failure: (ApiErrorModel error) {
      emit(FavouriteCharactersSuccessState(favouriteCharacters));
      showSnackBar(error.error);
    });
  }
}
