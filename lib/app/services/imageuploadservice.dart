import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:jobizy/app/module/alljobs/view/jobapply/model/imageuploadmodel.dart';
import 'package:jobizy/app/services/exceptionhandling.dart';
import 'package:jobizy/app/services/interceptor.dart';
import 'package:jobizy/app/util/connectioncheck.dart';
import 'package:jobizy/app/util/snackbar.dart';
import 'package:jobizy/app/util/url.dart';

class ImageUploadservice {
  Future<String> uploadImage(File file, ) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      'path': 'text',
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
    });
    if (await connectionCheck()) {
      print('image connection chceked');
      Dio dio = await Interceptorapi().getApiUser();
      try {
        final response = await dio.post(Url().imageUpload, data: formData);
        // var file = await dio.MultipartFile.fromFile(image.path,
        // filename: basename(image.path),
        log('image upload response: ${response.data}');
        log('image added');
        // contentType: MediaType("image", basename(image.path)));
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return response.data;
        } else {
          return response.data;
        }
      } on DioError catch (e) {
        if (e.response!.statusCode == 401) {
          return '';
        } else {
          final errorMessage = DioException.fromDioError(e).toString();
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(ShowDialogs.popUp(errorMessage));
        }
      }
    }
    return '';
  }
}
