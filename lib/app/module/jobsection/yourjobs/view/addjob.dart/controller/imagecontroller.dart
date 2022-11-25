import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobizy/app/module/jobsection/jobapply/model/imageuploadmodel.dart';
import 'package:jobizy/app/module/jobsection/yourjobs/controller/jobcontroller.dart';
import 'package:jobizy/app/module/jobsection/yourjobs/view/addjob.dart/controller/addjobcon.dart';
import 'package:jobizy/app/services/imageuploadservice.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class UserImagePovHome extends ChangeNotifier {
  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load(path);

    final file = File('${(await getTemporaryDirectory()).path}.jpg');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  File? imageFile;
  // image picking function
  void chosePIck(ImageSource source, BuildContext context) async {
    final imagPicker = ImagePicker();
    final xfile = await imagPicker.pickImage(source: source);
    if (xfile != null) {
      imageFile = File(xfile.path);
    }
    notifyListeners();
  }

  void pickSource(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Choose',
              style: GoogleFonts.spectral(
                fontSize: 25,
              )),
          actionsAlignment: MainAxisAlignment.center,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  chosePIck(ImageSource.camera, context);
                },
                icon: const Icon(
                  Icons.camera_alt,
                  size: 50,
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  chosePIck(ImageSource.gallery, context);
                },
                icon: const Icon(
                  Icons.image,
                  size: 50,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> createProfileRequest(BuildContext context) async {
    final pro = Provider.of<JobPostController>(context, listen: false);
    File image;
    imageFile != null
        ? image = imageFile!
        : image = await getImageFileFromAssets('asset/images/avathar.jpg');
    final obj =
        ImageUploadModel(response: 'success', file: image.path, path: 'Test');
    final String? imageResponse = await ImageUploadservice().uploadImage(image);
    if (imageResponse == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Image upload failed'),
        ),
      );
    } else {
      await pro.jobPostButton(context, imageResponse);
    }
  }
}
