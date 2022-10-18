import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobizy/app/util/colors.dart';
import 'package:jobizy/app/util/route.dart';
import 'package:jobizy/app/view/onboardings.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    toOnboard(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
          child: Image.asset(
        'assets/image-removebg-preview.png',
        height: 300,
        width: 300,
      )
          // child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          //   Stack(children: [
          //     SvgPicture.asset(
          //         "assets/casual-life-3d-man-searching-music-with-phone.png"),
          //     // const Positioned(
          //     //     top: 270,
          //     //     left: 113,
          //     //     child: Text(
          //     //       'JobEzy',
          //     //       style: TextStyle(
          //     //           fontSize: 35, fontWeight: FontWeight.w900, color: kWhite),
          //     //     ))
          //   ]),
          // ]),
          ),
    );
  }

  Future<void> toOnboard(context) async {
    await Future.delayed(const Duration(seconds: 3));
    RouteNavigator.pushReplacement(context, const OnBoardPage());
  }
}
