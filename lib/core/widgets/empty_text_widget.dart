import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty_app/core/helpers/app_extensions.dart';
import 'package:rick_and_morty_app/core/networking/api_error_model.dart';
import 'app_main_text.dart';

class EmptyTextWidget extends StatelessWidget {
  final String msg;

  const EmptyTextWidget({
    required this.msg,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppMainText(
          msg,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
