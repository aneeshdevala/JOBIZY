import 'package:flutter/widgets.dart';

class JobApplyController extends ChangeNotifier {
  final fistname = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final qualification = TextEditingController();
  final applyFormKey = GlobalKey<FormState>();
  final experience = TextEditingController();
  String resume = '';
  bool isloading = false;

  Future<void> jobApplyButton(context) async {
    if (applyFormKey.currentState!.validate()) {
      isloading = true;
    }
  }
}
