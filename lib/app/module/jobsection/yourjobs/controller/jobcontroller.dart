import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jobizy/app/module/jobsection/getsavedjobs/view/getsaved.dart';

import 'package:jobizy/app/module/jobsection/yourjobs/model/jobmodel.dart';
import 'package:jobizy/app/module/userprofile/widgets/yourjobs.dart';

import 'package:jobizy/app/services/jobservice.dart';
import 'package:jobizy/app/util/colors.dart';
import 'package:jobizy/app/util/connectioncheck.dart';
import 'package:jobizy/app/util/snackbar.dart';

class JobController extends ChangeNotifier {
  List<Postedjobsmodel> alljobs = [];
  int listchange = 0;
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

  void listchanges(int index) {
    listchange = index;
    notifyListeners();
  }

  Widget newWidget() {
    if (listchange == 0) {
      return SavedJobPage();
    } else if (listchange == 1) {
      return Container(
        height: 200,
        width: 200,
        color: kBlack,
      );
    } else if (listchange == 2) {
      return Yourjobswidget();
    } else {
      return Container();
    }
  }
}
