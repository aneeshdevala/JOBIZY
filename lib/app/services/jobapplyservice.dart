import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobizy/app/module/alljobs/view/jobapply/model/applymodel.dart';
import 'package:jobizy/app/module/alljobs/view/jobapply/model/applyresponce.dart';
import 'package:jobizy/app/services/exceptionhandling.dart';
import 'package:jobizy/app/services/interceptor.dart';
import 'package:jobizy/app/util/connectioncheck.dart';
import 'package:jobizy/app/util/url.dart';

class ApplyService {
  Future<Applyresponse?> applyjobser(Applymodel data, context) async {
    Dio dios = await Interceptorapi().getApiUser();
    if (await connectionCheck()) {
      try {
        Response response =
            await dios.post(Url().applyjob, data: data.toJson());
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          log('data posted success');
          return Applyresponse.fromJson(response.data);
        } else {
          return Applyresponse(message: 'Something went wrong');
        }
      } on DioError catch (e) {
        final errormsg = DioException.fromDioError(e).toString();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errormsg)));
      }
    }
  }
}
