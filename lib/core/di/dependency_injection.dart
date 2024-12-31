import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/core/networking/network_checker.dart';
import 'package:rick_and_morty_app/features/character_screen/data/character_repository/character_repository.dart';
import 'package:rick_and_morty_app/features/character_screen/data/data_source/remote_data_source/character_remote_data_source.dart';
import 'package:rick_and_morty_app/features/character_screen/domain/usecases/add_to_favourite.dart';
import 'package:rick_and_morty_app/features/character_screen/domain/usecases/delete_from_favourite.dart';
import 'package:rick_and_morty_app/features/character_screen/domain/usecases/get_character_use_case.dart';
import 'package:rick_and_morty_app/features/character_screen/domain/usecases/is_favourite_character.dart';
import 'package:rick_and_morty_app/features/character_screen/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/features/favourite_screen/data/data_source/local_data_source/favourite_database.dart';
import 'package:rick_and_morty_app/features/favourite_screen/domain/base_favourite_characters_repository/base_favourite_characters_repository.dart';
import 'package:rick_and_morty_app/features/favourite_screen/domain/use_cases/delete_from_favourite.dart';
import 'package:rick_and_morty_app/features/favourite_screen/presentation/bloc/favourite_bloc.dart';
import 'package:rick_and_morty_app/features/home_screen/presentation/bloc/home_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sqflite/sqflite.dart';
import '../../features/character_details_screen/data/character_details_repository/character_details_repository.dart';
import '../../features/character_details_screen/data/data_source/remote_data_source/character_details_remote_data_source.dart';
import '../../features/character_details_screen/domain/base_character_detials_repository/base_character_details_repository.dart';
import '../../features/character_details_screen/domain/use_cases/get_character_details_use_case.dart';
import '../../features/character_details_screen/presentation/bloc/character_details_bloc.dart';
import '../../features/character_screen/domain/base_character_repository/base_character_repository.dart';
import '../../features/favourite_screen/data/favourite_character_repository/favourite_characters_repository.dart';
import '../../features/favourite_screen/domain/use_cases/get_all_favourite_characters.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio
  Dio dio = DioFactory.init();
  // network connection checker
  InternetConnectionChecker ic = InternetConnectionChecker.instance;
  // network checker initialization
  getIt.registerLazySingleton<NetworkChecker>(() => NetworkCheckerImpl(ic));
  // local database initialization
  Database? db = await FavouriteDataBase.instance.initDatabase();
  // favourite database initialization
  getIt.registerLazySingleton<FavouriteDataBase>(
      () => FavouriteDataBase.instance);

  // cubits initialization
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
  getIt.registerFactory<CharacterCubit>(() => CharacterCubit(
      getCharacters: getIt(),
      addToFavourite: getIt(),
      deleteFromFavourite: getIt(),
      isFavouriteCharacter: getIt()));
  getIt.registerFactory<CharacterDetailsCubit>(
      () => CharacterDetailsCubit(getIt()));
  getIt.registerFactory<FavouriteCharactersCubit>(() =>
      FavouriteCharactersCubit(
          getAllFavouriteCharacters: getIt(), deleteFromFavourite: getIt()));

  // use cases initialization
  getIt.registerLazySingleton<GetCharacterUseCase>(
      () => GetCharacterUseCase(getIt()));
  getIt.registerLazySingleton<CharacterAddToFavouriteUseCase>(
      () => CharacterAddToFavouriteUseCase(getIt()));
  getIt.registerLazySingleton<CharacterDeleteFromFavouriteUseCase>(
      () => CharacterDeleteFromFavouriteUseCase(getIt()));
  getIt.registerLazySingleton<CharacterIsFavouriteCharacterUseCase>(
      () => CharacterIsFavouriteCharacterUseCase(getIt()));
  getIt.registerLazySingleton<FavouriteDeleteFromFavouriteUseCase>(
      () => FavouriteDeleteFromFavouriteUseCase(getIt()));
  getIt.registerLazySingleton<GetAllFavouriteCharactersUseCase>(
      () => GetAllFavouriteCharactersUseCase(getIt()));
  getIt.registerLazySingleton<GetCharacterDetailsUseCase>(
      () => GetCharacterDetailsUseCase(getIt()));

  // api services initialization
  getIt.registerLazySingleton<CharacterApiService>(
      () => CharacterApiService(dio));
  getIt.registerLazySingleton<CharacterDetailsApiService>(
      () => CharacterDetailsApiService(dio));

  // repositories initialization
  getIt.registerLazySingleton<BaseCharacterRepository>(
      () => CharacterRepository(getIt(), getIt(), getIt()));
  getIt.registerLazySingleton<BaseCharacterDetailsRepository>(
      () => CharacterDetailsRepository(getIt(), getIt()));
  getIt.registerLazySingleton<BaseFavouriteCharacterRepository>(
      () => FavouriteCharactersRepository(getIt()));
}
