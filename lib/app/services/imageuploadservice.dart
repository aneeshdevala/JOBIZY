import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:jobizy/app/module/alljobs/view/jobapply/model/imageuploadmodel.dart';
import 'package:jobizy/app/services/exceptionhandling.dart';
import 'package:jobizy/app/services/interceptor.dart';
import 'package:jobizy/app/util/connectioncheck.dart';
import 'package:jobizy/app/util/snackbar.dart';
import 'package:jobizy/app/util/url.dart';

class ImageUploadservice {
  Future<ImageUploadModel>? imageservice(data, context) async {
    FormData formData = FormData.fromMap({
      "profile_photo": await MultipartFile.fromFile(data.profilePhoto,
          filename: data.profilePhoto.split('/').last),
    });
    if (await connectionCheck()) {
      Dio dio = await Interceptorapi().getApiUser();
      try {
        final response = await dio.post(Url().imageUpload, data: formData);
        // var file = await dio.MultipartFile.fromFile(image.path,
        // filename: basename(image.path),
        // contentType: MediaType("image", basename(image.path)));
        if (response.statusCode! >= 200 && response.statusCode! <= 299) {
          return response.data;
        } else {
          return response.data;
        }
      } on DioError catch (e) {
        if (e.response!.statusCode == 401) {
          return ImageUploadModel(
            response: 'Something went wrong ! Please try again later',
          );
        } else {
          final errorMessage = DioException.fromDioError(e).toString();
          ScaffoldMessenger.of(context)
              .showSnackBar(ShowDialogs.popUp(errorMessage));
        }
      }
    }
    return ImageUploadModel(
        response: 'Something went wrong ! Please try again later');
  }
}
