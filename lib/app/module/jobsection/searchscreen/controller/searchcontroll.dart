import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jobizy/app/module/jobsection/searchscreen/model/searchmodel.dart';
import 'package:jobizy/app/module/jobsection/searchscreen/model/searchrespo.dart';
import 'package:jobizy/app/services/searchservice.dart';
import 'package:jobizy/app/util/connectioncheck.dart';
import 'package:jobizy/app/util/snackbar.dart';

class SearchController extends ChangeNotifier {
  List<SearchResponse> allsearchjobs = [];
  final searchKey = GlobalKey<FormState>();
  final searchController = TextEditingController();
  SearchResponse? jobId;
  bool isloading = false;
  void searchButton(context) async {
    if (await connectionCheck()) {
      isloading = true;
      notifyListeners();

      Searchmodel searchObj = Searchmodel(
        designation: searchController.text,
      );
      ModelSearch? searchResponse =
          await SearchService().searchpostservice(searchObj, context);

      if (searchResponse == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(ShowDialogs.popUp('No Response'));
        log('null');
        isloading = false;
        notifyListeners();
        return;
      } else {
        allsearchjobs.clear();
        allsearchjobs.addAll(searchResponse.listOfSearchResponse!);
        log(allsearchjobs.first.designation.toString());
        //  log(searchResponse.toString());
        isloading = false;
        notifyListeners();
        return;
      }
    }
    notifyListeners();
    void _isLoadingFalse() {
      isloading = false;
      notifyListeners();
    }
  }
}
