import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/helpers/app_extensions.dart';
import 'package:rick_and_morty_app/core/networking/api_error_model.dart';
import 'app_main_text.dart';

class AppErrorWidget extends StatelessWidget {
  final ApiErrorModel errorModel;

  const AppErrorWidget({
    required this.errorModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          errorModel.isNetworkConnectionError
              ? 'network_error_image'.png
              : 'error_msg_image'.png,
          height: 100.h,
          width: 100.w,
        ),
        20.hSpace,
        AppMainText(
          errorModel.error,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
