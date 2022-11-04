import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jobizy/app/util/route.dart';
import 'package:jobizy/app/module/bottomscreen/view/bottomsrcreen.dart';
import 'package:jobizy/app/module/register/loginscreen/view/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:recase/recase.dart';

class HomeController extends ChangeNotifier {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  final getStorage = GetStorage();
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
      return 'Gd Morning\n${getStorage.read("name")}'.pascalCase;
    }
    if (hour < 17) {
      return ' Gd Afternoon \n ${getStorage.read('name')}'.titleCase;
    }
    return 'Gd Evening \n ${getStorage.read('name')}'.titleCase;
  }
  // RichText(
  //   text: TextSpan(
  //     text: 'Wel',
  //     style: GoogleFonts.poppins(
  //       textStyle: const TextStyle(
  //         color: mainColor,
  //         fontSize: 25,
  //         fontWeight: FontWeight.w800,
  //       ),
  //     ),
  //     children: <TextSpan>[
  //       TextSpan(
  //         text: 'Come\n ${getStorage.read('name')}',
  //         style: GoogleFonts.archivo(
  //           textStyle: const TextStyle(
  //             color: kBlack,
  //             fontSize: 23,
  //             fontWeight: FontWeight.w800,
  //           ),
  //         ),
  //       ),
  //     ],
  //   ),
  // ),
}
