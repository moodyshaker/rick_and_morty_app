import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/di/dependency_injection.dart';
import 'package:rick_and_morty_app/core/theming/colors.dart';
import 'package:rick_and_morty_app/features/splash_screen.dart';
import 'core/router_manager/router_manager.dart';
import 'features/home_screen/presentation/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Rick And Morty App',
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        theme: ThemeData(
          scaffoldBackgroundColor: ColorsManager.white,
          appBarTheme: const AppBarTheme(
            color: ColorsManager.mainColor,
          ),
          useMaterial3: false,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
