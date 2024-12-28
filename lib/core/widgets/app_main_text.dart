import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/core/helpers/app_extensions.dart';
import 'package:rick_and_morty_app/core/theming/colors.dart';
import 'package:rick_and_morty_app/core/theming/font_weight_helper.dart';

class AppMainText extends StatelessWidget {
  final String? text;
  final String? family;
  final double? font;
  final double? decorationThickness;
  final double verticalPadding, horizontalPadding;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final TextAlign textAlign;
  final Color? color;
  final Color? decorationColor;
  final FontWeight? weight;
  final double? lineHeight;
  final int? maxLines;

  const AppMainText(
    this.text, {
    super.key,
    this.font,
    this.overflow,
    this.weight,
    this.lineHeight,
    this.decorationThickness,
    this.decoration,
    this.decorationColor,
    this.textAlign = TextAlign.start,
    this.verticalPadding = 0,
    this.horizontalPadding = 0,
    this.color,
    this.maxLines,
    this.family,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text!,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: TextStyle(
          color: color ?? ColorsManager.black,
          fontSize: font ?? 17.sp,
          height: lineHeight,
          fontWeight: weight ?? FontWeightHelper.medium,
          fontFamily: family,
          decoration: decoration ?? TextDecoration.none,
          decorationThickness: decorationThickness,
          decorationColor: decorationColor,
        )).symSpace(
      vertical: verticalPadding,
      horizontal: horizontalPadding,
    );
  }
}
