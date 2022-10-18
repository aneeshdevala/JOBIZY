import 'package:flutter/material.dart';
import 'package:jobizy/app/util/colors.dart';
import 'package:jobizy/app/util/constraisns.dart';
import 'package:jobizy/app/util/route.dart';
import 'package:jobizy/app/view/loginscreen.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                  child: Image.asset(
                'assets/casual-life-3d-boy-and-girl-sitting-in-chairs.png',
                height: 400,
              )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  kheight50,
                  Text(
                    'Find Your',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    'Dream Job',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w800,
                        color: mainColor),
                  ),
                  Text(
                    'Explore all the most exciting remote job roles\nbased on your interest.',
                    style: kTextStyle,
                  )
                ],
              )
            ],
          ),
        ),
      )),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            RouteNavigator.pushRemoveUntil(context, const SigninPage());
          },
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              minimumSize: const Size(60, 100),
              backgroundColor: mainColor),
          child: const Text(
            'Go',
            style: TextStyle(fontSize: 20),
          )),
    );
  }
}
