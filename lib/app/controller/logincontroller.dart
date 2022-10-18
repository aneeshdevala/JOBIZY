
import 'package:flutter/material.dart';
import 'package:jobizy/app/model/login/loginmodel.dart';
import 'package:jobizy/app/model/login/loginrespo.dart';
import 'package:jobizy/app/services/loginservice.dart';
import 'package:jobizy/app/util/route.dart';
import 'package:jobizy/app/util/snackbar.dart';
import 'package:jobizy/app/view/bottomsrcreen.dart';

class SigninController extends ChangeNotifier {
  final signinKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isloading = false;

  void loginButton(context) async {
    if (signinKey.currentState!.validate()) {
      isloading = true;
      notifyListeners();

      final loginObj = LoginModel(
          email: emailController.text, password: passwordController.text);

      LoginResponse? loginResponse =
          await LoginServices().signinServices(loginObj);
      if (loginResponse == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('No Response'));
        _isLoadingFalse();
        return;
      } else if (loginResponse.loggedin == true) {
        RouteNavigator.pushRemoveUntil(context, BottomScreen());
        _isLoadingFalse();
        return;
      } else if (loginResponse.success == false ||
          loginResponse.loggedin != true) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('${loginResponse.message}'));
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
    signinKey.currentState!.reset();
    emailController.clear();
    passwordController.clear();
    isHidden = true;
    notifyListeners();
  }
}
