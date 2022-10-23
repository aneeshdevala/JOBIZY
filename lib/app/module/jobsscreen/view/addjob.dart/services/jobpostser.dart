import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jobizy/app/module/jobsscreen/view/addjob.dart/model/jobpostmodel.dart';
import 'package:jobizy/app/module/jobsscreen/view/addjob.dart/model/response.dart';
import 'package:jobizy/app/services/interceptor.dart';
import 'package:jobizy/app/util/connectioncheck.dart';
import 'package:jobizy/app/util/url.dart';

class JobCreateServices {
  Future<JobResponseModel?> jobPostServices(JobPostModel data) async {
    Dio dios = await Interceptorapi().getApiUser();
    if (await connectionCheck()) {
      try {
        Response response = await dios.post(Url().jobPost, data: data.tojson());
        // final response = await DioServices.postFunction(
        //   url: Url().jobPost,
        //   value: data.tojson(),
        // );

        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          log('data added succesfully');
          return JobResponseModel.fromJson(response.data);
        } else {
          return JobResponseModel(message: 'Something Went Wrong');
        }
      } on DioError catch (e) {
        if (e.response!.statusCode == 400) {
          return JobResponseModel(message: 'Invalid data');
        }
      } catch (e) {
        return JobResponseModel(message: 'Something went wrong');
      }
    } else {
      return JobResponseModel(message: 'Please connect to internet');
    }

    return null;
  }
}
