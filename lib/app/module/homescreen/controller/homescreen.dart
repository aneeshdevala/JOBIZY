import 'package:flutter/material.dart';
import 'package:jobizy/app/module/register/loginscreen/model/loginrespo.dart';
import 'package:jobizy/app/util/route.dart';
import 'package:jobizy/app/module/bottomscreen/view/bottomsrcreen.dart';
import 'package:jobizy/app/module/register/loginscreen/view/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends ChangeNotifier {
  Future<void> logout(context) async {
    final prefs = await SharedPreferences.getInstance();
    final isloggedout = await prefs.setBool('loggedin', false);
    if (isloggedout) {
      RouteNavigator.pushRemoveUntil(context, const SigninPage());
    } else {
      RouteNavigator.pushRemoveUntil(context, BottomScreen());
    }
    notifyListeners();
  }

  //fetch user details
  void userdetails() {
    LoginResponse? userdetails;
  }
}
