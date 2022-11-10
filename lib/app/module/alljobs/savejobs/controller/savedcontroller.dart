
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jobizy/app/module/alljobs/model/searchrespo.dart';
import 'package:jobizy/app/module/alljobs/savejobs/model/savemodel.dart';
import 'package:jobizy/app/module/alljobs/savejobs/model/saveresponce.dart';
import 'package:jobizy/app/services/savedjobs.dart';
import 'package:jobizy/app/util/connectioncheck.dart';
import 'package:jobizy/app/util/snackbar.dart';

class JobSaveController extends ChangeNotifier {
  bool isLoading = false;
  //JobSearchModelResponse? jobSearchModel;

  Future<void> postSaveButton(
      context, SearchResponse jobSearchModel) async {
    if (await connectionCheck()) {
      isLoading = true;

      final obj = JobSaveModel(jobId: jobSearchModel.id);
      JobSaveResponseModel? jobsave =
          await JobSaveServices().saveServices(obj, context);

      if (jobsave == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('No Response.....'));
        isLoadingFalse();
        return;
      } else if (jobsave.saved == true) {
        log('Save Done');

        // RouteNavigator.pushRoute(context, const SavedJobPage());
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('Job added to List'));
        isLoadingFalse();
        return;
      } else if (jobsave.saved == false) {
        log('UnSave Done');

        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('Job removed from List'));

        isLoadingFalse();
        return;
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('Something went wrong'));
        isLoadingFalse();
        return;
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(ShowDialogs.popUp('Please check interent connection'));
    }
  }

  void isLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }
}
