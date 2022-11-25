// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jobizy/app/module/jobsection/searchscreen/model/searchrespo.dart';
import 'package:jobizy/app/module/jobsection/jobapply/model/applymodel.dart';
import 'package:jobizy/app/module/jobsection/jobapply/view/jobapplyscreen.dart';
import 'package:jobizy/app/module/register/loginscreen/controller/logincontroller.dart';
import 'package:jobizy/app/util/route.dart';
import 'package:provider/provider.dart';
import '../../../util/colors.dart';

class Aplywideget extends StatelessWidget {
  final SearchResponse jobs;
  final Applymodel? user;

  const Aplywideget({
    Key? key,
    required this.jobs,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Applymodel applymodel;
    final userId = GetStorage().read('id');
    bool canApply = true;
    for (var element in jobs.applicationStatus) {
      print(element['userId']);
      if (element['userId'] == userId) {
        canApply = false;
        break;
      }
    }
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(15.0),
        height: 80.0,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 10.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Card(
                elevation: 5.0,
                shadowColor: const Color(0xff008080),
                child: Container(
                  margin: const EdgeInsets.all(5.0),
                  child: const Icon(
                    Icons.bookmark,
                    color: Color(0xff008080),
                    size: 30,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: (() async {
                  if (!canApply) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('You have already applied for this job'),
                      ),
                    );
                    return;
                  }

                  RouteNavigator.pushRoute(
                      context,
                      ApplyJob(
                        jobId: jobs,
                      ));
                  // print(user?.userId);
                  print(jobs.userId);
                  //   print(id);
                  // print(jobs.id);
                }),
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: const BoxDecoration(
                    color: Color(0xff008080),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  height: 50.0,
                  child: Center(
                    child: !canApply
                        ? const Text('Alredy Applied',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ))
                        : const Text(
                            'Apply Now',
                            style: TextStyle(
                              color: kWhite,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

mixin FlutterSecureStorage {}
