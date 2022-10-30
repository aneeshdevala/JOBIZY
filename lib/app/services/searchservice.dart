import 'dart:developer';


import 'package:dio/dio.dart';

import 'package:jobizy/app/module/jobsearch/model/searchmodel.dart';
import 'package:jobizy/app/module/jobsearch/model/searchrespo.dart';

import 'package:jobizy/app/services/interceptor.dart';
import 'package:jobizy/app/util/connectioncheck.dart';
import 'package:jobizy/app/util/url.dart';

class SearchService {
  Future<SearchResponse?> searchpostservice(Searchmodel searchmodel)async{
    Dio dios = await Interceptorapi() .getApiUser();
    if(await connectionCheck()){
      try{
        Response response = await dios.post(Url().jobSearch);
        if(response.statusCode! >= 200 && response.statusCode! <= 299){
          log('data added succesfully');
          return SearchResponse.fromJson(response.data);
        }else{
          return SearchResponse(message: 'Something Went Wrong');
        }
      }on DioError catch(e){
        if(e.response!.statusCode == 400){
          return SearchResponse(message: 'Invalid data');
        }
      }catch(e){
        return SearchResponse(message: 'Something went wrong');
      }
    }
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