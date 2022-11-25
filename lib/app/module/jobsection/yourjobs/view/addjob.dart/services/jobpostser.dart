import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jobizy/app/module/jobsection/yourjobs/view/addjob.dart/model/jobpostmodel.dart';
import 'package:jobizy/app/module/jobsection/yourjobs/view/addjob.dart/model/response.dart';
import 'package:jobizy/app/services/interceptor.dart';
import 'package:jobizy/app/util/connectioncheck.dart';
import 'package:jobizy/app/util/url.dart';

class JobCreateServices {
  Future<JobResponseModel?> jobPostServices(JobPostModel data) async {
    Dio dios = await Interceptorapi().getApiUser();
    if (await connectionCheck()) {
      log('======  has internet  =====');
      try {
        Response response = await dios.post(
          Url().jobPost,
          data: data.tojson(),
        );

        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          log('==========job posted succesfully========');
          return JobResponseModel.fromJson(response.data);
        } else {
          return JobResponseModel(message: 'Something Went Wrong');
        }
      } on DioError catch (e) {
        log('======job post dio error=====');
        if (e.response!.statusCode == 400) {
          return JobResponseModel(message: 'Invalid data');
        }
      } catch (e) {
        return JobResponseModel(message: 'Something went wrong');
      }
    } else {
      log('======  internet error  =====');
      return JobResponseModel(message: 'Please connect to internet');
    }

    return null;
  }
}
