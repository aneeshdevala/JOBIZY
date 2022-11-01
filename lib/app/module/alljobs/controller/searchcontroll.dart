import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jobizy/app/module/alljobs/model/searchmodel.dart';
import 'package:jobizy/app/module/alljobs/model/searchrespo.dart';
import 'package:jobizy/app/services/searchservice.dart';
import 'package:jobizy/app/util/connectioncheck.dart';
import 'package:jobizy/app/util/snackbar.dart';

class SearchController extends ChangeNotifier {
  List<SearchResponse> allsearchjobs = [];
  final searchKey = GlobalKey<FormState>();
  final searchController = TextEditingController();
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
        return;
      } else {
        allsearchjobs.clear();
        allsearchjobs.addAll(searchResponse.listOfSearchResponse!);
        log(allsearchjobs.first.designation.toString());
        //  log(searchResponse.toString());
        isloading = false;
        return;
      }
    }

    // void _isLoadingFalse() {
    //   isloading = false;
    //   notifyListeners();
    // }
  }
}
