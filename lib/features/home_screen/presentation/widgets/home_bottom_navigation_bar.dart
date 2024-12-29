import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
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
    return AnimatedBottomNavigationBar.builder(
        itemCount: context.read<HomeCubit>().iconList.length,
        height: 60.h,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? ColorsManager.mainColor : ColorsManager.gray;
          return Center(
            child: Image.asset(
              context.read<HomeCubit>().iconList[index].png,
              height: 30.h,
              width: 30.w,
              color: color,
            ),
          );
        },
        borderColor: ColorsManager.lighterGray,
        backgroundColor: ColorsManager.white,
        activeIndex: context.read<HomeCubit>().currentIndex,
        splashColor: ColorsManager.mainColor,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        gapLocation: GapLocation.none,
        onTap:  context.read<HomeCubit>().changeCurrent);
  }
}
