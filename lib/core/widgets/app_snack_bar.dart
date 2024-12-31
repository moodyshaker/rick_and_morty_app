import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/theming/colors.dart';
import 'package:rick_and_morty_app/core/widgets/app_main_text.dart';
import '../router_manager/router_manager.dart';

showSnackBar(
  String message, {
  duration = 3,
}) {
  ScaffoldMessenger.of(navigatorKey.currentContext!).hideCurrentSnackBar();
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      backgroundColor: ColorsManager.mainColor,
      behavior: SnackBarBehavior.fixed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppMainText(
            message,
            color: ColorsManager.white,
            font: 12.sp,
          ),
        ],
      ),
      duration: Duration(seconds: duration),
    ),
  );
}
