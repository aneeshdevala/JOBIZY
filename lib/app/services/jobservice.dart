import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobizy/app/module/jobsection/yourjobs/model/jobmodel.dart';
import 'package:jobizy/app/services/exceptionhandling.dart';
import 'package:jobizy/app/services/interceptor.dart';
import 'package:jobizy/app/util/url.dart';

class GetAllJobsService {
  Future<List<Postedjobsmodel>?> getAlljobsFor(context) async {
    Dio dios = await Interceptorapi().getApiUser();

    try {
      final Response response = await dios.get(Url().postedjobs);

      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        final dataList = (response.data as List).map((e) {
          return Postedjobsmodel.fromJson(e);
        }).toList();
        return dataList;
      } else {
        const ScaffoldMessenger(
            child: Text('Something went wrong ! Please try again later'));
        return [];
      }
    } on DioError catch (e) {
      final errormessage = DioException.fromDioError(e).toString();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(errormessage)));
    } catch (e) {
      return [];
    }
    return null;
  }
}
