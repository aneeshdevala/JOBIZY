import 'package:flutter/material.dart';
import 'package:jobizy/app/module/splash&onboard/splashacreen.dart';
import 'package:jobizy/app/util/providers/allproviders.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AllProviders.providers());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JobEzy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ScreenSplash(),
    );
  }
}
