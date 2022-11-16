import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobizy/app/module/alljobs/yourjobs/view/addjob.dart/controller/addjobcon.dart';
import 'package:provider/provider.dart';

class UserImagePovHome extends ChangeNotifier {
  String imageToString = '';

  pickImage(context) async {
    final provider = Provider.of<JobPostController>(context, listen: false);
    final imageFromGallery =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    final bytes = File(imageFromGallery!.path).readAsBytesSync();
    //provider.imageBinary = base64Encode(bytes);
    notifyListeners();
  }

}