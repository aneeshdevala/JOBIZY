import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jobizy/app/module/jobsearch/model/searchrespo.dart';
import 'package:jobizy/app/services/dioservices.dart';
import 'package:jobizy/app/services/exceptionhandling.dart';
import 'package:jobizy/app/util/connectioncheck.dart';
import 'package:jobizy/app/util/url.dart';

class SearchService {
  
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
}
