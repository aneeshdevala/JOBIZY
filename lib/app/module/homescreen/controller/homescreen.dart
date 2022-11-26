import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobizy/app/module/homescreen/model/getpost.dart';
import 'package:jobizy/app/services/homeservices/getallpost.dart';
import 'package:jobizy/app/util/route.dart';
import 'package:jobizy/app/module/bottomscreen/view/bottomsrcreen.dart';
import 'package:jobizy/app/module/register/loginscreen/view/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:recase/recase.dart';

import '../../../util/colors.dart';
import '../../../util/connectioncheck.dart';
import '../../../util/snackbar.dart';

class HomeController extends ChangeNotifier {
  List<Getpostmodel> allpost = [];
  bool isLoading = false;
  final getStorage = GetStorage();

  FlutterSecureStorage storage = const FlutterSecureStorage();
  HomeController(context) {
    getAllpost(context);
  }

  Future<void> getAllpost(context) async {
    isLoading = true;
    notifyListeners();
    if (await connectionCheck()) {
      final response = await GetPostService().getallPost(context);
      if (response == null) {
        ShowDialogs.popUp('Error');
        isLoadingFalse();
        return;
      } else if (response.isNotEmpty) {
        allpost.clear();
        print(response);
        allpost.addAll(response);
        isLoadingFalse();
        notifyListeners();
        return;
      } else if (response.isEmpty) {
        ShowDialogs.popUp("Nothing returned");
        isLoadingFalse();
        notifyListeners();
      }
    } else {
      ShowDialogs.popUp("No internet");
    }
    isLoadingFalse();
    notifyListeners();
  }

  //*************Logout screeen****** */
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
  void userdetails() {}
  //Greetings
  Future<void> greeting() async {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      greetings =
          "Good Mornig\n${await storage.read(key: 'name') ?? ''}".toString();
      notifyListeners();
   
    } else if (hour < 17) {
      greetings =
          "Good Noon\n${await storage.read(key: 'name') ?? ''}".toString();
      notifyListeners();
     
    } else {
      greetings =
          "Good Evening\n${await storage.read(key: 'name') ?? ''}".toString();
      notifyListeners();
     
    }
  }

  String greetings = '';

  void isLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }
}
