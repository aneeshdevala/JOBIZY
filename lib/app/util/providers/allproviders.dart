import 'package:flutter/widgets.dart';
import 'package:jobizy/app/module/alljobs/savejobs/controller/savedcontroller.dart';
import 'package:jobizy/app/module/alljobs/view/jobapply/controller/applycontroller.dart';
import 'package:jobizy/app/module/bottomscreen/controller/bottomnavcon.dart';
import 'package:jobizy/app/module/homescreen/controller/homescreen.dart';
import 'package:jobizy/app/module/alljobs/controller/searchcontroll.dart';
import 'package:jobizy/app/module/register/signupscreen/controller/signupcontroller.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
import '../../module/alljobs/yourjobs/controller/jobcontroller.dart';
import '../../module/alljobs/yourjobs/view/addjob.dart/controller/addjobcon.dart';
import '../../module/register/loginscreen/controller/logincontroller.dart';
import '../../module/splash&onboard/splashacreen.dart';

class AllProviders {
  static Widget providers() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => JobSaveController()),
        ChangeNotifierProvider(create: (_) => JobApplyController()),
        ChangeNotifierProvider(create: (_) => SearchController()),
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
