import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobizy/app/module/alljobs/savejobs/model/savemodel.dart';
import 'package:jobizy/app/services/exceptionhandling.dart';
import 'package:jobizy/app/services/interceptor.dart';
import 'package:jobizy/app/util/connectioncheck.dart';
import 'package:jobizy/app/util/snackbar.dart';
import 'package:jobizy/app/util/url.dart';

import '../module/alljobs/savejobs/model/saveresponce.dart';

class JobSaveServices {
  Future<JobSaveResponseModel?> saveServices(JobSaveModel data, context) async {
    if (await connectionCheck()) {
      Dio dios = await Interceptorapi().getApiUser();
      try {
        Response response =
            await dios.post(Url().postSave, data: data.toJson());

        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return JobSaveResponseModel.fromJson(response.data);
        } else {
          return JobSaveResponseModel(
              message: "Something went wrong while Save");
        }
      } on DioError catch (e) {
        final eMessage = DioException.fromDioError(e).toString();
        ScaffoldMessenger.of(context).showSnackBar(ShowDialogs.popUp(eMessage));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(ShowDialogs.popUp('Please check interent Connection'));
    }
    return null;
  }
}
