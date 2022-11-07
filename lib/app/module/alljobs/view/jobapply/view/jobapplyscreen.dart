import 'package:flutter/material.dart';
import 'package:jobizy/app/module/alljobs/model/searchrespo.dart';
import 'package:jobizy/app/module/alljobs/view/jobapply/controller/applycontroller.dart';
import 'package:jobizy/app/util/colors.dart';
import 'package:jobizy/app/util/constraisns.dart';
import 'package:provider/provider.dart';

import '../../../../homescreen/widgets/textformfield.dart';

class ApplyJob extends StatelessWidget {
  const ApplyJob({required this.jobId, super.key});
  final SearchResponse jobId;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<JobApplyController>(context, listen: false);
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: provider.applyFormKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormWidget(
                            hintxt: 'First Name',
                            hiddentext: false,
                            icon: Icons.person,
                            iconsize: 23,
                            textHeight: 15,
                            padding: 20,
                            color: kGrey,
                            radius: 10,
                            iconcolor: kBlack,
                            controller: provider.fistname,
                            validatorErrorMessage: "Name is required",
                          ),
                          kheight,
                          TextFormWidget(
                            hintxt: 'Last Name',
                            hiddentext: false,
                            icon: Icons.person,
                            iconsize: 23,
                            textHeight: 15,
                            padding: 20,
                            color: kGrey,
                            radius: 10,
                            iconcolor: kBlack,
                            controller: provider.lastname,
                            validatorErrorMessage: "Last Name is required",
                          ),
                          kheight,
                          TextFormWidget(
                            hintxt: 'Email',
                            hiddentext: false,
                            icon: Icons.person,
                            iconsize: 23,
                            textHeight: 15,
                            padding: 20,
                            color: kGrey,
                            radius: 10,
                            iconcolor: kBlack,
                            controller: provider.emailcontroller,
                            validatorErrorMessage: "Email is required",
                          ),
                          kheight,
                          TextFormWidget(
                            hintxt: 'Contact Number',
                            hiddentext: false,
                            icon: Icons.person,
                            iconsize: 23,
                            textHeight: 15,
                            padding: 20,
                            color: kGrey,
                            radius: 10,
                            iconcolor: kBlack,
                            controller: provider.phonecontroller,
                            validatorErrorMessage: "Contact is required",
                          ),
                          ElevatedButton(
                              onPressed: () {
                                provider.jobApplyButton(jobId, context);
                                //provider.dispose();
                              },
                              child: const Text('Apply'))
                        ]),
                  ),
                ))));
  }
}
