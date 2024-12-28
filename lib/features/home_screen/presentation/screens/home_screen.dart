import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/di/dependency_injection.dart';
import 'package:rick_and_morty_app/core/helpers/app_extensions.dart';
import 'package:rick_and_morty_app/core/theming/colors.dart';
import 'package:rick_and_morty_app/core/widgets/app_main_text.dart';
import 'package:rick_and_morty_app/features/home_screen/presentation/bloc/home_states.dart';
import 'package:rick_and_morty_app/features/home_screen/presentation/widgets/home_bottom_navigation_bar.dart';

import '../bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: AppMainText(
              context.read<HomeCubit>().title,
              color: ColorsManager.white,
              font: 20.sp,
            ),
          ),
          body: context.read<HomeCubit>().currentScreen,
          bottomNavigationBar: HomeBottomNavigationBar(),
        ),
      ),
    );
  }
}