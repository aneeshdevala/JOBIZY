



import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

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
                  ),),
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
}