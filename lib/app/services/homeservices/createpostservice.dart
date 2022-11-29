// class Create

import 'package:dio/dio.dart';
import 'package:jobizy/app/module/homescreen/model/createpostmodel.dart';
import 'package:jobizy/app/module/homescreen/model/createpostres.dart';
import 'package:jobizy/app/services/interceptor.dart';
import 'package:jobizy/app/util/connectioncheck.dart';
import 'package:jobizy/app/util/url.dart';

class PostService {
  Future<Postresponcemodel?> postcreateService(Postmodel data) async {
    Dio dios = await Interceptorapi().getApiUser();
    if (await connectionCheck()) {
      try {
        Response response = await dios.post(
          Url().createPost,
          data: data.toJson(),
        );
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return Postresponcemodel.fromJson(response.data);
        } else {
          return Postresponcemodel(message: 'Something went wrong');
        }
      } on DioError catch (e) {
        if (e.response!.statusCode == 400) {
          return Postresponcemodel(message: 'Invalid data');
        }
      }catch(e){
        return Postresponcemodel(message: 'Something went wrong');
      }
    }
    return null;
  }
}
