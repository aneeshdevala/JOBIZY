import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:jobizy/app/module/jobsearch/model/searchmodel.dart';
import 'package:jobizy/app/module/jobsearch/model/searchrespo.dart';
import 'package:jobizy/app/services/exceptionhandling.dart';

import 'package:jobizy/app/services/interceptor.dart';
import 'package:jobizy/app/util/connectioncheck.dart';
import 'package:jobizy/app/util/snackbar.dart';
import 'package:jobizy/app/util/url.dart';

class SearchService {
  Future<SearchResponse> searchpostservice(
      Searchmodel searchmodel, context) async {
    if (await connectionCheck()) {
      Dio dios = await Interceptorapi().getApiUser();
      try {
        final response =
            await dios.post(Url().jobSearch, data: searchmodel.toJson());
        log("===============");
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          log('data passes successfully');
          // log(response.toString());

          return SearchResponse.fromJson(response.data[0]);
        } else {
          return SearchResponse(
            message: 'Something went wrong ! Please try again later',
          );
          // searchResponseFromJson(response.data);
        }
      } on DioError catch (e) {
        if (e.response!.statusCode == 401) {
          return SearchResponse(
            message: 'Something went wrong ! Please try again later',
          );
          //SearchResponse(message: 'Invalid data');
        } else {
          final errorMessage = DioException.fromDioError(e).toString();
          ScaffoldMessenger.of(context)
              .showSnackBar(ShowDialogs.popUp(errorMessage));
        }
      }
    }
    return SearchResponse(
      message: 'Something went wrong ! Please try again later',
    );
  }
}
// Future<List<SearchResponse>?> searchService(String data, context) async {
  //   if (await connectionCheck()) {
  //     try {
  //       final response =
  //           await DioServices.postFunction(url: Url().jobSearch, value: data);

  //       if (response.statusCode! >= 200 && response.statusCode! <= 299) {
  //         final dataList = (response.data as List).map((e) {
  //           return SearchResponse.fromJson(e);
  //         }).toList();
  //         log('search response ${response.data}');
  //         return dataList;
  //       } else {
  //         const ScaffoldMessenger(
  //           child: Text('Something went wrong ! Please try again later'),
  //         );
  //         return [];
  //       }
  //     } on DioError catch (e) {
  //       final errormessage = DioException.fromDioError(e).toString();
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text(errormessage)));
  //     } catch (e) {
  //       return [];
  //     }
  //   }
  //   return null;
  // }