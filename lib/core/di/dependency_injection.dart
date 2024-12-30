import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_app/core/networking/network_checker.dart';
import 'package:rick_and_morty_app/features/character_screen/data/character_repository/character_repository.dart';
import 'package:rick_and_morty_app/features/character_screen/data/data_source/remote_data_source/character_remote_data_source.dart';
import 'package:rick_and_morty_app/features/character_screen/domain/usecases/get_character_use_case.dart';
import 'package:rick_and_morty_app/features/character_screen/presentation/bloc/character_bloc.dart';
import 'package:rick_and_morty_app/features/home_screen/presentation/bloc/home_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../features/character_details_screen/data/character_details_repository/character_details_repository.dart';
import '../../features/character_details_screen/data/data_source/remote_data_source/character_details_remote_data_source.dart';
import '../../features/character_details_screen/domain/base_character_detials_repository/base_character_details_repository.dart';
import '../../features/character_details_screen/domain/use_cases/get_character_details_use_case.dart';
import '../../features/character_details_screen/presentation/bloc/character_details_bloc.dart';
import '../../features/character_screen/domain/base_character_repository/base_character_repository.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio
  Dio dio = DioFactory.init();
  // network connection checker
  InternetConnectionChecker ic = InternetConnectionChecker.instance;
// network checker initialization
  getIt.registerLazySingleton<NetworkChecker>(() => NetworkCheckerImpl(ic));

  // cubits initialization
  getIt.registerFactory<HomeCubit>(() => HomeCubit());
  getIt.registerFactory<CharacterCubit>(() => CharacterCubit(getIt()));
  getIt.registerFactory<CharacterDetailsCubit>(
      () => CharacterDetailsCubit(getIt()));

  // use cases initialization
  getIt.registerLazySingleton<GetCharacterUseCase>(
      () => GetCharacterUseCase(getIt()));
  getIt.registerLazySingleton<GetCharacterDetailsUseCase>(
      () => GetCharacterDetailsUseCase(getIt()));

  // api services initialization
  getIt.registerLazySingleton<CharacterApiService>(
      () => CharacterApiService(dio));
  getIt.registerLazySingleton<CharacterDetailsApiService>(
      () => CharacterDetailsApiService(dio));

  // repositories initialization
  getIt.registerLazySingleton<BaseCharacterRepository>(
      () => CharacterRepository(getIt(), getIt()));
  getIt.registerLazySingleton<BaseCharacterDetailsRepository>(
      () => CharacterDetailsRepository(getIt(), getIt()));
}
