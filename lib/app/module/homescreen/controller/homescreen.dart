import 'dart:ffi';

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
  homeController(context) {
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
  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      notifyListeners();
      return Text(
        'Good Morning \n${getStorage.read('name')}'.titleCase,
        style: GoogleFonts.poppins(
            color: kBlack, fontSize: 20, fontWeight: FontWeight.w500),
      ).data!;
    } else if (hour < 17) {
      notifyListeners();
      return Text(
        'Good Afternoon \n${getStorage.read('name')}'.titleCase,
        style: GoogleFonts.poppins(
            color: kBlack, fontSize: 20, fontWeight: FontWeight.w500),
      ).data!;
    } else {
      notifyListeners();
      return Text(
        'Good Evening \n${getStorage.read('name')}'.titleCase,
        style: GoogleFonts.poppins(
            color: kBlack, fontSize: 20, fontWeight: FontWeight.w500),
      ).data!;
    }
  }

  void isLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }
}
