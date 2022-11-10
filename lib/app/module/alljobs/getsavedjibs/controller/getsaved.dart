import 'package:flutter/material.dart';
import 'package:jobizy/app/module/alljobs/getsavedjibs/model/getsaved.dart';
import 'package:jobizy/app/services/getsavedservice.dart';
import 'package:jobizy/app/util/connectioncheck.dart';
import 'package:jobizy/app/util/snackbar.dart';


class SavedJobsController extends ChangeNotifier {
  List<GetSaved> alljobs = [];
  bool isLoading = false;
  bool buttonColor = false;

  SavedJobsController(context) {
    getAllSavedJobs(context);
  }

  Future<void> getAllSavedJobs(context) async {
    isLoading = true;
    notifyListeners();
    if (await connectionCheck()) {
      final response = await GetSavedServices().savedResponse(context);
      if (response == null) {
        ShowDialogs.popUp('Error');
        isLoadingFalse();
        return;
      } else if (response.isNotEmpty) {
        alljobs.clear();
        alljobs.addAll(response);
        isLoadingFalse();
        notifyListeners();
        return;
      } else if (response.isEmpty) {
        ShowDialogs.popUp("Nothing returned");
        isLoadingFalse();
        notifyListeners();
      }
    } else {
      ShowDialogs.popUp("No internet");
    }
    isLoadingFalse();
    notifyListeners();
  }

  void isLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }
}
