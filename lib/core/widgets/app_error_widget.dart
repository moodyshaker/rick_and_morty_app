import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/helpers/app_extensions.dart';
import 'app_main_text.dart';

class AppErrorWidget extends StatelessWidget {
  final String errorMessage;

  const AppErrorWidget({
    required this.errorMessage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'error_msg_image'.png,
          height: 100.h,
          width: 100.w,
        ),
        20.hSpace,
        AppMainText(
          errorMessage,
        ),
      ],
    );
  }
}
