import 'package:dio/dio.dart';
import 'package:jobizy/app/util/url.dart';


class DioServices {
  static final dio = Dio(BaseOptions(baseUrl: Url.baseUrl));
  //================Dio Post Method=================
  static Future<Response<dynamic>> postFunction(
      {required String url, required value}) async {
    return await dio.post(url, data: value).then((value) {
      return value;
    });
  }
    // ======== DIO GET METHOD ========
  static Future<Response> getMethod({required String url}) async {
    return await dio.get(url).then((value) => value);
  }
}
