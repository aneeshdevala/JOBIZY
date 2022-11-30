import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobizy/app/module/jobsection/jobapply/model/applymodel.dart';
import 'package:jobizy/app/module/jobsection/jobapply/model/applyresponce.dart';
import 'package:jobizy/app/services/exceptionhandling.dart';
import 'package:jobizy/app/services/interceptor.dart';
import 'package:jobizy/app/util/connectioncheck.dart';
import 'package:jobizy/app/util/url.dart';

class ApplyService {
  Future<Applyresponse?> applyjobservice(Applymodel data, context) async {
  //  print('startedapplying');
    Dio dios = await Interceptorapi().getApiUser();
    if (await connectionCheck()) {
     // print('connected');
      try {
       // print(data.toJson());
        Response response =
            await dios.post(Url().applyjob, data: data.toJson());
        log(response.toString());
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          log('data posted success');
          log(response.toString());
          return Applyresponse.fromJson(response.data);
        } else if (response.statusCode! == 400) {
          log("Haiii");
          return Applyresponse(message: 'Already Applied for this Job');
        } else {
          return Applyresponse(message: 'Something went wrong');
        }
      } on DioError catch (e) {
        log('Hai');
        log(e.toString());
        final errormsg = DioException.fromDioError(e).toString();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(errormsg)));
      }
    }
    return null;
    //
  }
}
