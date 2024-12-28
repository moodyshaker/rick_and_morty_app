import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Context extensions
extension ContextExtensions on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);

  double get width => MediaQuery.sizeOf(this).width;

  double get height => MediaQuery.sizeOf(this).height;

  Future<dynamic> push(Widget route) =>
      Navigator.of(this).push(_pageRoute(route));

  Future<dynamic> pushReplacement(Widget route) =>
      Navigator.of(this).pushReplacement(_pageRoute(route));

  Future<dynamic> pushNamedAndRemoveUntil(Widget page,
      {RoutePredicate? predicate}) =>
      Navigator.of(this)
          .pushAndRemoveUntil(_pageRoute(page), predicate ?? (route) => false);

  void get pop => Navigator.of(this).pop();
}

/// Navigation open route based on our Platform [android] or [ios]
Route<dynamic> _pageRoute(Widget page) => Platform.isAndroid
    ? MaterialPageRoute(builder: (_) => page)
    : CupertinoPageRoute(builder: (_) => page);


/// String Extensions
extension StringExtensions on String {
  String get png => 'assets/images/$this.png';
}

/// Number Extensions
extension NumberExtensions on num {
  SizedBox get hSpace => SizedBox(height: h.toDouble());

  SizedBox get wSpace => SizedBox(width: w.toDouble());
}

/// Widget Extensions
extension PaddingExtensions on Widget {
  Padding horSpace(double horizontal) => Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontal),
        child: this,
      );

  Padding singleSpace({double l = 0.0, r = 0.0, t = 0.0, b = 0.0}) => Padding(
        padding: EdgeInsets.only(top: t, right: r, left: l, bottom: b),
        child: this,
      );

  Padding verSpace(double vertical) => Padding(
        padding: EdgeInsets.symmetric(vertical: vertical),
        child: this,
      );

  Padding symSpace({double vertical = 0.0, double horizontal = 0.0}) => Padding(
        padding:
            EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: this,
      );

  InkWell onPressed(Function() onPressed) => InkWell(
        onTap: onPressed,
        child: this,
      );

  ClipRRect circleWidget(double radius) => ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: this,
      );
}
