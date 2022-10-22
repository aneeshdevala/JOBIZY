import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobizy/app/model/login/loginrespo.dart';
import 'package:jobizy/app/services/dioservices.dart';
import 'package:jobizy/app/services/exceptionhandling.dart';

import 'package:jobizy/app/util/url.dart';

import '../model/login/loginmodel.dart';

class LoginServices {
 
  Future<LoginResponse?> signinServices(LoginModel data, context) async {
    try {
      final response = await DioServices.postFunction(
          url: Url().login, value: data.tojson());
      // log(response.data.toString());
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        log('Login Was Successfull');
        log(response.data.toString());
        return LoginResponse.fromJson(response.data);
      } else {
        return LoginResponse(message: 'Something Went Wrong');
      }
    } on DioError catch (e) {
      final errormessage = DioException.fromDioError(e).toString();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errormessage)));
    } catch (e) {
      throw e.toString();
    }

    return null;
  }
  
}
