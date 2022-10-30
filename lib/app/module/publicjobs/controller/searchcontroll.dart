import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jobizy/app/module/jobsearch/model/searchmodel.dart';
import 'package:jobizy/app/module/jobsearch/model/searchrespo.dart';
import 'package:jobizy/app/services/searchservice.dart';

class SearchController extends ChangeNotifier {
  List<Searchmodel> allsearchjobs = [];
  final searchKey = GlobalKey<FormState>();
  final searchController = TextEditingController();
  bool isloading = false;
  void searchButton(context) async {
    if (searchKey.currentState!.validate()) {
      isloading = true;
      notifyListeners();

      Searchmodel searchObj = Searchmodel(
        designation: searchController.text,
      );
      print(searchObj);
      SearchResponse? searchResponse =
          await SearchService().searchpostservice(searchObj);

      if (searchResponse == null) {
        print('null');
        log('null');
        return;
      } else {
        allsearchjobs = searchResponse as List<Searchmodel>;
        print('search jobs $allsearchjobs');
        isloading = false;
        notifyListeners();
      }
      notifyListeners();
    }

    void _isLoadingFalse() {
      isloading = false;
      notifyListeners();
    }
  }
}
