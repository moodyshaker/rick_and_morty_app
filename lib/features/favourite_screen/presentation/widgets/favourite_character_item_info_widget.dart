import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/helpers/app_extensions.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/app_main_text.dart';

class FavouriteCharacterItemInfoWidget extends StatelessWidget {
  final String infoTitle;
  final String infoData;

  const FavouriteCharacterItemInfoWidget(
      {required this.infoTitle, required this.infoData, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppMainText(
          infoTitle,
          font: 11.sp,
          color: ColorsManager.black,
        ),
        4.wSpace,
        AppMainText(
          infoData.split(' ').first,
          font: 11.sp,
          color: ColorsManager.mainColor,
        ),
      ],
    );
  }
}
