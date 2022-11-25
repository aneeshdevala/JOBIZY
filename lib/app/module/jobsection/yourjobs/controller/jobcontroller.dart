import 'package:flutter/widgets.dart';

import 'package:jobizy/app/module/jobsection/yourjobs/model/jobmodel.dart';

import 'package:jobizy/app/services/jobservice.dart';
import 'package:jobizy/app/util/connectioncheck.dart';
import 'package:jobizy/app/util/snackbar.dart';

class JobController extends ChangeNotifier {
  List<Postedjobsmodel> alljobs = [];
  bool isLoading = false;
  JobController(context) {
    getAllJobs(context);
    notifyListeners();
  }

  // JobController() {
  //   getAllJobs(co);
  // }

  getAllJobs(context) async {
    if (await connectionCheck()) {
      isLoading = true;
      notifyListeners();
      final postedresponse = await GetAllJobsService().getAlljobsFor(context);
      if (postedresponse == null) {
        ShowDialogs.popUp('Please check your internet connection');
        isLoadingFalse();
        return;
      } else if (postedresponse.isEmpty) {
        ShowDialogs.popUp("Nothing returned");
        isLoadingFalse();
        return;
      } else if (postedresponse.isNotEmpty) {
        alljobs.clear();
        alljobs.addAll(postedresponse);

        isLoadingFalse();
        notifyListeners();
      }
    }
    // print("-----------------------------------------------------");
    // print(alljobs.last.country);
    notifyListeners();
  }

  // -->> function to make loading false
  void isLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }
}
