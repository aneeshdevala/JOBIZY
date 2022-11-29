import 'package:flutter/material.dart';
import 'package:jobizy/app/module/homescreen/model/createpostmodel.dart';
import 'package:jobizy/app/module/homescreen/model/createpostres.dart';
import 'package:jobizy/app/services/homeservices/createpostservice.dart';
import 'package:jobizy/app/util/snackbar.dart';


class CreatePostController extends ChangeNotifier {
  final textController = TextEditingController();
  bool isloading = false;

  Future<void> CreatePostButton(context) async {
    print('======job post started=====');
    if (textController.text.isNotEmpty) {
      print('======job post started=====');
      final Postmodel postObj = Postmodel(
          title: textController.text, image: '', likes: [], comments: []);
      Postresponcemodel? postResponceModel =
          await PostService().postcreateService(postObj);
      if (postResponceModel == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('No Response'));
        _isLoadingFalse();
        return;
      }else {
     ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('Post Created'));
      }
    }
  }

  void _isLoadingFalse() {
    isloading = false;
    notifyListeners();
  }
}
