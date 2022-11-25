import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobizy/app/module/jobsection/appliedjobs/model/appliedresponce.dart';
import 'package:jobizy/app/services/exceptionhandling.dart';
import 'package:jobizy/app/services/interceptor.dart';
import 'package:jobizy/app/util/url.dart';

class AppliedJobsService {
  Future<List<Appliedmodel>?> getAppliedJobs(context) async {
    Dio dios = await Interceptorapi().getApiUser();

    try {
      final Response response = await dios.get(Url().appliedjob);
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        final jobList = (response.data as List)
            .map((e) => Appliedmodel.fromJson(e))
            .toList();
        return jobList;
      } else {
        const ScaffoldMessenger(
            child: Text('Something went wrong ! Please try again'));
        return [];
      }
    } on DioError catch (e) {
      final errormsg = DioException.fromDioError(e).toString();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errormsg)));
    } catch (e) {
      return [];
    }
    return null;
  }
}
