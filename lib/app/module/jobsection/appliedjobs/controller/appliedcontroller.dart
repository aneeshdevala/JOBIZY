import 'package:flutter/widgets.dart';
import 'package:jobizy/app/module/jobsection/appliedjobs/model/appliedresponce.dart';
import 'package:jobizy/app/services/appliedjobservic.dart';
import 'package:jobizy/app/util/connectioncheck.dart';
import 'package:jobizy/app/util/snackbar.dart';

class ApliedController extends ChangeNotifier {
  List<Appliedmodel> alljobs = [];
  bool isLoading = false;

  ApliedController(context) {
    getAllappliedjobs(context);
  }
  Future<void> getAllappliedjobs(context) async {
    isLoading = true;
    notifyListeners();
    if (await connectionCheck()) {
      final response = await AppliedJobsService().getAppliedJobs(context);
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
  }

  void isLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }
}
