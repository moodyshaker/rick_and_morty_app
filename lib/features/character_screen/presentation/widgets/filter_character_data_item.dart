import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/helpers/app_extensions.dart';
import 'package:rick_and_morty_app/core/theming/colors.dart';
import 'package:rick_and_morty_app/core/theming/font_weight_helper.dart';
import 'package:rick_and_morty_app/core/widgets/app_main_text.dart';

class FilterCharacterDataItem extends StatelessWidget {
  final String data;
  final bool isChosen;

  const FilterCharacterDataItem(
      {required this.data, this.isChosen = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isChosen
            ? SizedBox(
                height: 20.h,
                width: 20.w,
                child: const Icon(
                  Icons.done,
                  color: ColorsManager.mainColor,
                ),
              )
            : SizedBox(
                height: 20.h,
                width: 20.w,
              ),
        8.wSpace,
        AppMainText(
          data,
          font: isChosen ? 15.sp : 13.sp,
          color: isChosen ? ColorsManager.mainColor : ColorsManager.black,
          weight: isChosen ? FontWeightHelper.bold : FontWeightHelper.medium,
        )
      ],
    );
  }
}
