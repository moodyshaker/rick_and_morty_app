import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../networking/dio_factory.dart';

final getIt = GetIt.instance;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.init();
  // getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  //
  // // login cubit & login repo
  // getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(apiService: getIt()));
  // getIt.registerFactory<LoginCubit>(() => LoginCubit(loginRepo: getIt()));
  //
  // // register cubit & register repo
  // getIt.registerLazySingleton<RegisterRepo>(
  //     () => RegisterRepo(apiService: getIt()));
  // getIt.registerFactory<RegisterCubit>(
  //     () => RegisterCubit(registerRepo: getIt()));
  //
  // // homeRepo && homeAPiService
  // getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  // getIt
  //     .registerLazySingleton<HomeRepo>(() => HomeRepo(homeApiService: getIt()));
}
