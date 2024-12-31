import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/helpers/app_extensions.dart';
import 'package:rick_and_morty_app/core/theming/font_weight_helper.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/app_main_text.dart';

class CharacterDetailsInfoWidget extends StatelessWidget {
  final String title;
  final String data;

  const CharacterDetailsInfoWidget({
    required this.title,
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppMainText(
          title,
          font: 13.sp,
          weight: FontWeightHelper.semiBold,
          color: ColorsManager.black,
        ),
        8.wSpace,
        AppMainText(
          data,
          font: 13.sp,
          weight: FontWeightHelper.bold,
          color: ColorsManager.mainColor,
        ),
      ],
    );
    ;
  }
}
