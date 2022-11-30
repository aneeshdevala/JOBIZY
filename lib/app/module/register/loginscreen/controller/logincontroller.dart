import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jobizy/app/module/jobsection/jobapply/model/applymodel.dart';
import 'package:jobizy/app/module/register/loginscreen/model/loginmodel.dart';
import 'package:jobizy/app/module/register/loginscreen/model/loginrespo.dart';
import 'package:jobizy/app/services/loginservice.dart';
import 'package:jobizy/app/util/route.dart';
import 'package:jobizy/app/util/snackbar.dart';
import 'package:jobizy/app/module/bottomscreen/view/bottomsrcreen.dart';

class SigninController extends ChangeNotifier {
  final signinKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final getStorage = GetStorage();
  bool isloading = false;
  LoginResponse? resp;
  Applymodel? applymodel;

  void loginButton(context) async {
    if (signinKey.currentState!.validate()) {
      isloading = true;
      notifyListeners();

      final loginObj = LoginModel(
          email: emailController.text, password: passwordController.text);

      LoginResponse? loginResponse =
          await LoginServices().signinServices(loginObj, context);
      if (loginResponse == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('Something went wrong'));
        _isLoadingFalse();
        return;
      } else if (loginResponse.loggedin == true) {
        resp = loginResponse;

     //   print('++++++++++++++++++++++++++++++++====');

     //   print(resp!.token);
        log(resp!.id.toString());

        getStorage.write('name', resp!.name);
        getStorage.write('id', resp!.id);
        notifyListeners();
        await storedatalogin(value: loginResponse);
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
    notifyListeners();
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

  FlutterSecureStorage storage = const FlutterSecureStorage();
  Future<void> storedatalogin({required LoginResponse value}) async {
    notifyListeners();
    log(value.name.toString());
    await storage.write(key: 'token', value: value.token!);
    await storage.write(key: 'name', value: value.name!);
    await storage.write(key: 'id', value: value.id!);
    await storage.write(key: 'loggedin', value: value.loggedin.toString());
    await storage.write(key: 'login', value: "true");
  }
}
