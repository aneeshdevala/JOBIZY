import 'package:flutter/material.dart';
import 'package:jobizy/app/module/jobsection/searchscreen/model/searchrespo.dart';
import 'package:jobizy/app/module/jobsection/jobapply/model/applymodel.dart';
import 'package:jobizy/app/module/jobsection/jobapply/model/applyresponce.dart';
import 'package:jobizy/app/module/jobsection/mainscreen/viewscreen.dart';
import 'package:jobizy/app/services/jobapplyservice.dart';
import 'package:jobizy/app/util/route.dart';
import 'package:jobizy/app/util/snackbar.dart';

class JobApplyController extends ChangeNotifier {
  final fistname = TextEditingController();
  final lastname = TextEditingController();
  final emailcontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final qualificationcontroller = TextEditingController();
  final applyFormKey = GlobalKey<FormState>();
  final experiencecontroller = TextEditingController();
  String resume = '';

  bool isloading = false;

  void _isLoadingFalse() {
    isloading = false;
    notifyListeners();
  }

  Future<void> jobApplyButton(SearchResponse jobid, context) async {
  //  print('clicked');
    if (applyFormKey.currentState!.validate()) {
      isloading = true;
    //  print('loading');
      final Applymodel modelObj = Applymodel(
          jobId: jobid.id,
          fname: fistname.text,
          lname: lastname.text,
          email: emailcontroller.text,
          phone: phonecontroller.text,
          experience: experiencecontroller.text,
          userId: jobid.userId,
          qualification: qualificationcontroller.text);
      // print(modelObj.email);
      // print(modelObj.userId);
      Applyresponse? applyresponse =
          await ApplyService().applyjobservice(modelObj, context);
    //  print(applyresponse);
      if (applyresponse == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('some thing went wrong '));
        _isLoadingFalse();
        return;
      } else if (applyresponse.applied == true) {
     //   print('alredy UploDED');
        RouteNavigator.pushReplacement(context, const AllJobs());
        _isLoadingFalse();
      } else if (applyresponse.applied == false) {
      //  print('job applied done');
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('Already applied'));
        _isLoadingFalse();
      }
    }
  }

  void disposes() {
    applyFormKey.currentState!.reset();
  }
}
