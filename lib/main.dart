import 'package:flutter/material.dart';
import 'package:jobizy/app/module/bottomscreen/controller/bottomnavcon.dart';
import 'package:jobizy/app/module/homescreen/controller/homescreen.dart';
import 'package:jobizy/app/module/jobsscreen/controller/jobcontroller.dart';
import 'package:jobizy/app/module/jobsscreen/view/addjob.dart/controller/addjobcon.dart';
import 'package:jobizy/app/module/register/loginscreen/controller/logincontroller.dart';
import 'package:jobizy/app/module/register/signupscreen/controller/signupcontroller.dart';
import 'package:jobizy/app/util/route.dart';
import 'package:jobizy/app/module/splash&onboard/splashacreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => JobController(context)),
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => JobPostController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => SigninController()),
        ChangeNotifierProvider(create: (_) => SignupController()),
        ChangeNotifierProvider(create: (_) => BottomNavBarController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'JobEzy',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ScreenSplash(),
      ),
    );
  }
}
