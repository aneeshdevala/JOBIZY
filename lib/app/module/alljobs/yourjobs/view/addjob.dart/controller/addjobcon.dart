

import 'package:flutter/material.dart';

import 'package:jobizy/app/module/alljobs/yourjobs/controller/jobcontroller.dart';
import 'package:jobizy/app/module/alljobs/yourjobs/view/addjob.dart/model/jobpostmodel.dart';
import 'package:jobizy/app/module/alljobs/yourjobs/view/addjob.dart/model/response.dart';
import 'package:jobizy/app/module/alljobs/yourjobs/view/addjob.dart/services/jobpostser.dart';
import 'package:jobizy/app/module/alljobs/yourjobs/view/job_screen.dart';
import 'package:jobizy/app/util/route.dart';
import 'package:jobizy/app/util/snackbar.dart';
import 'package:provider/provider.dart';

class JobPostController extends ChangeNotifier {
  final companyName = TextEditingController();
  final companyPlace = TextEditingController();
  final companystate = TextEditingController();
  final companyCountry = TextEditingController();
  final jobDesignation = TextEditingController();
  final jobVaccancies = TextEditingController();
  final minSalary = TextEditingController();
  final maxSalary = TextEditingController();
  final jobDiscription = TextEditingController();
  final minExp = TextEditingController();
  final maxExp = TextEditingController();
  bool displayNewTextfield = false;
  final jobFormKey = GlobalKey<FormState>();
  String dropdownValue = 'Select';
  String jobType = '';
  bool isloading = false;

  Future<void> jobPostButton(context) async {
    if (jobFormKey.currentState!.validate() && jobType.isNotEmpty) {
      isloading = true;
      notifyListeners();
      final pro = Provider.of<JobController>(context, listen: false);
      pro.getAllJobs(context);
      notifyListeners();

      // FlutterSecureStorage storage = const FlutterSecureStorage();
      // String? token = await storage.read(key: "token");

      final JobPostModel jobObj = JobPostModel(
        company: companyName.text,
        country: companyCountry.text,
        description: jobDiscription.text,
        designation: jobDesignation.text,
        jobFor: dropdownValue,
        jobType: jobType,
        place: companyPlace.text,
        salaryMax: maxSalary.text,
        salaryMin: minSalary.text,
        state: companystate.text,
        vacancy: jobVaccancies.text,
        expMax: minExp.text,
        expMin: minExp.text,
      );

      JobResponseModel? jobResponseModel =
          await JobCreateServices().jobPostServices(jobObj);

      if (jobResponseModel == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('No Response.....'));
        _isLoadingFalse();
        return;
      } else if (jobResponseModel.success == true) {
        await Provider.of<JobController>(context).getAllJobs(context);
        _isLoadingFalse();
        notifyListeners();
        RouteNavigator.pushRemoveUntil(context, const JobScreen());
        return;
      } else if (jobResponseModel.success == false) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('Invalid Data'));
        _isLoadingFalse();
        return;
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('Something Went Wrong'));
        _isLoadingFalse();
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(ShowDialogs.popUp('Please select the Job Type'));
      _isLoadingFalse();
    }
  }

  String groupValue = 'Fresher';
  radioButton(value) {
    groupValue = value;
    notifyListeners();
  }

  validator(context) {
    if (jobFormKey.currentState!.validate() && jobType.isNotEmpty) {
      RouteNavigator.pushRoute(context, const JobScreen());
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(ShowDialogs.popUp('Please select the Job Type'));
    }
  }

  void _isLoadingFalse() {
    isloading = false;
    notifyListeners();
  }

  void dispos(context) {
    jobFormKey.currentState!.reset();
    companyCountry.clear();
    companyName.clear();
    companyPlace.clear();
    companystate.clear();
    jobDesignation.clear();
    jobDiscription.clear();
    minSalary.clear();
    maxSalary.clear();
    minExp.clear();
    maxExp.clear();
    notifyListeners();
  }

  void imageController() {}
}
