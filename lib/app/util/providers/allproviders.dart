import 'package:flutter/widgets.dart';
import 'package:jobizy/app/module/bottomscreen/controller/bottomnavcon.dart';
import 'package:jobizy/app/module/homescreen/controller/homescreen.dart';
import 'package:jobizy/app/module/publicjobs/controller/searchcontroll.dart';
import 'package:jobizy/app/module/register/signupscreen/controller/signupcontroller.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
import '../../module/jobsscreen/controller/jobcontroller.dart';
import '../../module/jobsscreen/view/addjob.dart/controller/addjobcon.dart';
import '../../module/register/loginscreen/controller/logincontroller.dart';
import '../../module/splash&onboard/splashacreen.dart';

class AllProviders {
  static Widget providers() {
    return MultiProvider(
      providers: [
      //  ChangeNotifierProvider(create: (_) => SearchController()),
        ChangeNotifierProvider(create: (context) => JobController(context)),
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => JobPostController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => SigninController()),
        ChangeNotifierProvider(create: (_) => SignupController()),
        ChangeNotifierProvider(create: (_) => BottomNavBarController()),
      ],
      child: const MyApp(),
    );
  }
}
