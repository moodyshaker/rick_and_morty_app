import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/colors.dart';

class AppTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool isPassword;
  final bool isPhone;
  final bool readOnly;
  final Widget? suffixIcon;
  final TextInputType? inputType;
  final Color? backgroundColor;
  final double? typingTextSize;
  final double? hintTextSize;
  final Color? hintTextColor;
  final Color? typingTextColor;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function()? onTap;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.readOnly = false,
    this.enabledBorder,
    this.inputTextStyle,
    this.typingTextColor,
    this.typingTextSize,
    this.hintTextColor,
    this.hintTextSize,
    this.hintStyle,
    this.inputType,
    this.onTap,
    required this.hintText,
    this.isPassword = false,
    this.isPhone = false,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    this.validator,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
          isDense: true,
          contentPadding: widget.contentPadding ??
              EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          focusedBorder: widget.focusedBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorsManager.mainBlue,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
          enabledBorder: widget.enabledBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: ColorsManager.lighterGray,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          hintStyle: widget.hintStyle ??
              TextStyle(
                  fontSize: widget.hintTextSize ?? 15.sp,
                  color: widget.hintTextColor ?? ColorsManager.lightGray),
          hintText: widget.hintText,
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _isObscureText = !_isObscureText;
                    });
                  },
                  child: Icon(
                    _isObscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                )
              : widget.suffixIcon,
          fillColor: widget.backgroundColor ?? ColorsManager.moreLightGray,
          filled: true,
          counterText: ''),
      maxLength: widget.isPhone ? 11 : null,
      keyboardType: widget.inputType,
      obscureText: widget.isPassword ? _isObscureText : false,
      style: TextStyle(
          fontSize: widget.typingTextSize ?? 15.sp,
          color: widget.typingTextColor ?? ColorsManager.black),
      validator: widget.validator,
      readOnly: widget.readOnly,
      onTapAlwaysCalled: widget.onTap != null,
      onTap: widget.onTap,
    );
  }
}
