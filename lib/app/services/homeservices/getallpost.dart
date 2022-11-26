import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobizy/app/module/homescreen/model/getpost.dart';
import 'package:jobizy/app/services/exceptionhandling.dart';
import 'package:jobizy/app/services/interceptor.dart';
import 'package:jobizy/app/util/url.dart';

class GetPostService{
  Future<List<Getpostmodel>?> getallPost(context) async {
    Dio dios = await Interceptorapi().getApiUser();

    try {
      final Response response = await dios.get(Url().getpost);
      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        final postList = (response.data as List)
            .map((e) => Getpostmodel.fromJson(e))
            .toList();
        return postList;
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