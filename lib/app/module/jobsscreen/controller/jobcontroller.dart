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

  // JobController() {
  //   getAllJobs(co);
  // }

  Future<void> getAllJobs(context) async {
    if (await connectionCheck()) {
      isLoading = true;
      notifyListeners();
      final postedresponse =
          await GetAllJobsService().getAlljobs(context);
      if (postedresponse == null) {
        ShowDialogs.popUp('Please check your internet connection');
        isLoadingFalse();
        return;
      } else if (postedresponse.success == false) {
        ShowDialogs.popUp(postedresponse.message ?? 'Something went wrong');
        return;
      } else if (postedresponse.success == true) {
        
      }
    }
  }

  // -->> function to make loading false
  void isLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }
}
