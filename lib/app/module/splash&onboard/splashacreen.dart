import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jobizy/app/util/colors.dart';
import 'package:jobizy/app/util/route.dart';
import 'package:jobizy/app/module/bottomscreen/view/bottomsrcreen.dart';
import 'package:jobizy/app/module/splash&onboard/onboardings.dart';
import 'package:provider/provider.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _SplashPageState();
}

class _SplashPageState extends State<ScreenSplash> {
  @override
  void initState() {
    Provider.of<SplashProvider>(context, listen: false).splashCheck(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            'assets/image-removebg-preview.png',
            height: 300,
            width: 300,
          ),
        ]),
      ),
    );
  }
}

class SplashProvider extends ChangeNotifier {
  String? data = '';

  final storage = const FlutterSecureStorage();

  splashCheck(context) async {
    await Future.delayed(const Duration(seconds: 3));

    storage.read(key: "login").then((value) {
      data = value;

      if (data == 'true') {
        RouteNavigator.pushReplacement(context, BottomScreen());
      } else {
        RouteNavigator.pushReplacement(context, const OnBoardPage());
      }
    });
  }
}
