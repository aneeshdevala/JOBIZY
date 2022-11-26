import 'dart:js';

import 'package:jobizy/app/module/jobsection/jobapply/controller/applycontroller.dart';
import 'package:provider/provider.dart';

class DateFormate{

  static DateTime minAgo=DateTime.now().subtract(const Duration(minutes:1));
  static DateTime hourAgo=DateTime.now().subtract(const Duration(hours: 1));
  static DateTime dayAgo=DateTime.now().subtract(const Duration(days: 1));
  static DateTime weekAgo=DateTime.now().subtract(const Duration(days: 7));
  static DateTime monthAgo=DateTime.now().subtract(const Duration(days: 30));
  static DateTime yearAgo=DateTime.now().subtract(const Duration(days: 365));
}