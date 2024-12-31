import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class RouterManager {
  static BuildContext? currentContext = navigatorKey.currentContext;

  static Future<dynamic> navigateTo(Widget page) =>
      navigatorKey.currentState!.push(_pageRoute(page));

  static Future<dynamic> navigateAndPopAll(Widget page) =>
      navigatorKey.currentState!.pushAndRemoveUntil(
        _pageRoute(page),
        (_) => false,
      );

  static Future<dynamic> navigateAndPopUntilFirstPage(Widget page) =>
      navigatorKey.currentState!
          .pushAndRemoveUntil(_pageRoute(page), (route) => route.isFirst);

  static Future<dynamic> navigateAndPop(Widget page) =>
      navigatorKey.currentState!.pushReplacement(_pageRoute(page));

  static bool get canPop => navigatorKey.currentState!.canPop();

  static void pop() => navigatorKey.currentState!.pop();

  static Route<dynamic> _pageRoute(Widget page) => Platform.isIOS
      ? CupertinoPageRoute(builder: (_) => page)
      : MaterialPageRoute(builder: (_) => page);
}
