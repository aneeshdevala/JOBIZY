import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jobizy/app/controller/logincontroller.dart';
import 'package:jobizy/app/model/login/loginrespo.dart';
import 'package:jobizy/app/util/url.dart';
import 'package:provider/provider.dart';

// class HomeService {
//   // static String token =
//   //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzNTIxOTc0NmIwYWI0MjVhMDE3ZjE1ZiIsImlhdCI6MTY2NjM2ODE5NSwiZXhwIjoxNjY4OTYwMTk1fQ.7seVgFy7BiPyd3CNFYkkC0NWkb0DfAjXERFOh5ty0XI";
//   // final userToken = Dio(BaseOptions(baseUrl: Url.baseUrl, headers: {
//   //   "Authorization":
//   //       "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzNTIxOTc0NmIwYWI0MjVhMDE3ZjE1ZiIsImlhdCI6MTY2NjM2ODE5NSwiZXhwIjoxNjY4OTYwMTk1fQ.7seVgFy7BiPyd3CNFYkkC0NWkb0DfAjXERFOh5ty0XI"
//   // }));
//   final dio = Dio();
//   Future<void> userToke() async {
//     final response = dio.get(Url.baseUrl,
//         options: Options(headers: {
//           "Authorization":
//               "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzNTIxOTc0NmIwYWI0MjVhMDE3ZjE1ZiIsImlhdCI6MTY2NjM2OTgxMiwiZXhwIjoxNjY4OTYxODEyfQ.jlo1lJcv4ZytIsbsbqr8xPt8b-Z9gJCewwb3Nwo63ks"
//         }));
//     log(response.toString());
//   }
//   //final userTocken=Dio(BaseOptions(baseUrl:Url().post ))
// }
