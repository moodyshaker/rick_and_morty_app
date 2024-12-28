import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/helpers/app_extensions.dart';
import '../../../../core/theming/colors.dart';
import '../bloc/home_bloc.dart';

class HomeBottomNavigationBar extends StatelessWidget {
   const HomeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        selectedItemColor: ColorsManager.mainColor,
        currentIndex: context.read<HomeCubit>().currentIndex,
        onTap: context.read<HomeCubit>().changeCurrent,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                  'character_icon_2'.png,
                  height: 30.h,
                  width: 30.h,
                  color: context.read<HomeCubit>().currentIndex == 0
                      ? ColorsManager.mainColor
                      : null),
              label: 'Characters'),
          BottomNavigationBarItem(
              icon: Image.asset(
                  'favourite_icon'.png,
                  height: 24.h,
                  width: 24.h,
                  color: context.read<HomeCubit>().currentIndex == 1
                      ? ColorsManager.mainColor
                      : null
              ),
              label: 'Favourites'),
        ]);
  }
}
