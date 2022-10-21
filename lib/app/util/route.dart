import 'package:flutter/material.dart';

class RouteNavigator {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static push({required var screen}) {
    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static pushreplace({required var screen}) {
    navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }
  static pushRoute(context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => screen));
  }

  static pushReplacement(context, Widget screen) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => screen));
  }

  static popRoute(context) {
    Navigator.of(context).pop();
  }

  static pushRemoveUntil(context, Widget screen) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => screen), (route) => false);
  }
}
