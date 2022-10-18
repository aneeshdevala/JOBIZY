
import 'package:flutter/material.dart';
import 'package:jobizy/app/model/signupmo/signup_model.dart';
import 'package:jobizy/app/model/signupmo/signupresponse.dart';
import 'package:jobizy/app/services/registerservice.dart';
import 'package:jobizy/app/util/route.dart';
import 'package:jobizy/app/util/snackbar.dart';
import 'package:jobizy/app/view/bottomsrcreen.dart';

class SignupController extends ChangeNotifier {
  final signupKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final mobileController = TextEditingController();
  bool isloading = false;

  void registerButton(context) async {
    if (signupKey.currentState!.validate()) {
      isloading = true;

      final modelObj = RegisterModel(
          email: emailController.text,
          name: userNameController.text,
          password: passwordController.text,
          mobile: mobileController.text);

      RegisterResponse? registerResponse =
          await RegisterServices().signupServices(modelObj);

      if (registerResponse == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('No Response'));
        _isLoadingFalse();
        return;
      } else if (registerResponse.loggedin == true) {
        RouteNavigator.pushRemoveUntil(context, BottomScreen());
        _isLoadingFalse();
        return;
      } else if (registerResponse.success == false ||
          registerResponse.loggedin != true) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('${registerResponse.message}'));
        _isLoadingFalse();
        return;
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('Something Went Wrong'));
        _isLoadingFalse();
      }
    }
  }

  void _isLoadingFalse() {
    isloading = false;
    notifyListeners();
  }

  bool _isHidden = false;
  get isHidden => _isHidden;
  set isHidden(value) {
    _isHidden = value;
    notifyListeners();
  }

  void disposes() {
    signupKey.currentState!.reset();
    emailController.clear();
    passwordController.clear();
    isHidden = true;
    notifyListeners();
  }
}
