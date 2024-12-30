import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/helpers/app_extensions.dart';
import 'package:rick_and_morty_app/core/theming/colors.dart';
import 'package:rick_and_morty_app/core/theming/font_weight_helper.dart';
import 'package:rick_and_morty_app/core/widgets/app_main_text.dart';

class ErrorDialog extends StatelessWidget {
  final String msg;

  const ErrorDialog({required this.msg, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: AppMainText(
        msg,
        font: 15.sp,
        weight: FontWeightHelper.medium,
        color: ColorsManager.black,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop;
          },
          child: AppMainText(
            'Okay',
            font: 14.sp,
            weight: FontWeightHelper.semiBold,
            color: ColorsManager.mainColor,
          ),
        ),
      ],
    );
  }
}
