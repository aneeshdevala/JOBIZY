import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jobizy/app/util/colors.dart';
import 'package:jobizy/app/util/route.dart';
import 'package:jobizy/app/view/bottomscreen/bottomsrcreen.dart';
import 'package:jobizy/app/view/loginscreen/loginscreen.dart';
import 'package:jobizy/app/view/onboardings.dart';
import 'package:provider/provider.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: mainColor,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Image.asset(
                'assets/image-removebg-preview.png',
                height: 300,
                width: 300,
              ))
            ]),
      ),
    );
  }
}

class SplashProvider extends ChangeNotifier {
  final storage = const FlutterSecureStorage();

  String? data = '';
  SplashProvider(context) {
    storage.read(key: "login").then((value) {
      data = value;
      log(value.toString());
    });
    check();
  }
  check() {
    Timer(const Duration(seconds: 2), () {
      if (data == "true") {
        RouteNavigator.pushreplace(screen: const SigninPage());
      } else {
        RouteNavigator.pushreplace(screen: const OnBoardPage());
      }
    });
    notifyListeners();
  }
}
