
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jobizy/app/model/login/loginrespo.dart';
import 'package:jobizy/app/services/dioservices.dart';
import 'package:jobizy/app/util/connectioncheck.dart';
import 'package:jobizy/app/util/url.dart';

import '../model/login/loginmodel.dart';

class LoginServices {
  Future<LoginResponse?> signinServices(LoginModel data) async {
    if (await connectionCheck()) {
      try {
        final response = await DioServices.postFunction(
            url: Url().login, value: data.tojson());

        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          log('Login Was Successfull');
          return LoginResponse.fromJson(response.data);
        } else {
          return LoginResponse.fromJson(response.data);
        }
      } on DioError catch (e) {
        if (e.response!.statusCode == 400) {
          return LoginResponse(message: "Email or Password Was Incorrect");
        }
      } catch (e) {
        return LoginResponse(message: "Something Went wrong");
      }
    } else {
      return LoginResponse(message: "Please check internet connection");
    }
    return null;
  }
}
