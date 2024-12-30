import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/helpers/app_extensions.dart';
import 'package:rick_and_morty_app/core/theming/font_weight_helper.dart';
import 'package:rick_and_morty_app/core/widgets/app_main_text.dart';

import '../../../../core/theming/colors.dart';

class EpisodeItem extends StatelessWidget {
  final String episode;

  const EpisodeItem({
    required this.episode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
          color: ColorsManager.moreLighterGray,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
                color: ColorsManager.black.withOpacity(0.1),
                blurRadius: 3,
                spreadRadius: 2,
                offset: const Offset(3, 0))
          ]),
      child: Column(
        children: [
          Image.asset(
            'app_icon'.png,
            height: 60.h,
            width: 60.w,
          ),
          10.hSpace,
          AppMainText(
            'Episode ${episode.split('/').last}',
            font: 12.sp,
            weight: FontWeightHelper.medium,
          )
        ],
      ),
    );
  }
}
