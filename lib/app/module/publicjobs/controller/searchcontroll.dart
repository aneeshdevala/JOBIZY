// import 'package:flutter/widgets.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:jobizy/app/module/jobsearch/model/searchmodel.dart';
// import 'package:jobizy/app/module/jobsearch/model/searchrespo.dart';
// import 'package:jobizy/app/services/searchservice.dart';

// class SearchController extends ChangeNotifier {
//   List<Searchmodel> allsearchjobs = [];
//   final searchKey = GlobalKey<FormState>();
//   final searchController = TextEditingController();
//   bool isloading = false;
//   void searchButton(context) async {
//     if (searchKey.currentState!.validate()) {
//       isloading = true;
//       notifyListeners();

//       final searchObj = Searchmodel(
//         designation: searchController.text,
//       );
//     //final searchallResponce = await SearchService().searchService(allsearchjobs.toString(), context);
//       if (searchallResponce == null) {
//         print('null');
//         return;
//       } else if (searchallResponce.isNotEmpty) {
//         allsearchjobs.clear();
//         allsearchjobs.addAll(searchallResponce);
    
//         print('Success');
//       }
//       notifyListeners();
//     }

//     void _isLoadingFalse() {
//       isloading = false;
//       notifyListeners();
//     }
//   }
// }
