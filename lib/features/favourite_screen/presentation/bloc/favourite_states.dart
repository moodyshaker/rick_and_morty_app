import 'package:rick_and_morty_app/core/networking/api_error_model.dart';
import 'package:rick_and_morty_app/features/character_screen/domain/entity/character_entity.dart';
import 'package:rick_and_morty_app/features/favourite_screen/data/model/favourite_character_model.dart';

sealed class FavouriteCharactersStates {}

class FavouriteCharactersInitState extends FavouriteCharactersStates {}

class FavouriteCharactersLoadingState extends FavouriteCharactersStates {}

class FavouriteCharactersSuccessState<T> extends FavouriteCharactersStates {

  final List<FavouriteCharacterModel> favouriteList;

  FavouriteCharactersSuccessState(this.favouriteList);
}

class FavouriteCharactersErrorState extends FavouriteCharactersStates {
  final ApiErrorModel apiErrorModel;

  FavouriteCharactersErrorState(this.apiErrorModel);
}
