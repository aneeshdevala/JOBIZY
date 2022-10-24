import 'package:flutter/widgets.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:jobizy/app/module/jobsscreen/model/jobmodel.dart';
import 'package:jobizy/app/module/jobsscreen/model/jobrespons.dart';
import 'package:jobizy/app/services/jobservice.dart';
import 'package:jobizy/app/util/connectioncheck.dart';
import 'package:jobizy/app/util/snackbar.dart';

class JobController extends ChangeNotifier {
  List<Postedjobsmodel> alljobs = [];
  bool isLoading = false;
  JobController(context) {
    getAllJobs(context);
  }

  // JobController() {
  //   getAllJobs(co);
  // }

  getAllJobs(context) async {
    if (await connectionCheck()) {
      isLoading = true;
      notifyListeners();
      final postedresponse = await GetAll().getAlljobsFor(context);
      if (postedresponse == null) {
        ShowDialogs.popUp('Please check your internet connection');
        isLoadingFalse();
        return;
      } else if (postedresponse.isEmpty) {
        ShowDialogs.popUp("Nothing returned");
        return;
      } else if (postedresponse.isNotEmpty) {
        alljobs.clear();
        alljobs.addAll(postedresponse);

        isLoadingFalse();
        notifyListeners();
      }
    }
    print("-----------------------------------------------------");
    print(alljobs.last.country);
    notifyListeners();
  }

  // -->> function to make loading false
  void isLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }
}
