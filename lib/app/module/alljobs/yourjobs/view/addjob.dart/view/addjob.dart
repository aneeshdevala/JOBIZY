import 'package:flutter/material.dart';
import 'package:jobizy/app/module/alljobs/yourjobs/view/job_screen.dart';
import 'package:jobizy/app/module/bottomscreen/controller/bottomnavcon.dart';
import 'package:jobizy/app/module/alljobs/yourjobs/view/addjob.dart/controller/addjobcon.dart';
import 'package:jobizy/app/module/alljobs/yourjobs/view/addjob.dart/view/widgets/radiobutton.dart';
import 'package:jobizy/app/util/colors.dart';
import 'package:jobizy/app/util/constraisns.dart';

import 'package:jobizy/app/util/route.dart';
import 'package:provider/provider.dart';

class AddjobScreen extends StatelessWidget {
  const AddjobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<JobPostController>(context, listen: false);
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: kWhite,
          title: const Text('Post a Job',
              style: TextStyle(
                  color: kBlack, fontSize: 25, fontWeight: FontWeight.w600)),
          leading: IconButton(
            onPressed: () {
              RouteNavigator.popRoute(context);
            },
            icon: const Icon(Icons.arrow_back_ios, color: kBlack),
          )),
      body: SingleChildScrollView(
        child: Form(
          key: provider.jobFormKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Find a great Hire',
                    style: TextStyle(
                        color: kBlack,
                        fontSize: 25,
                        fontWeight: FontWeight.w600)),
                kheight20,
                TextFormWidget(
                    keyboardtype: TextInputType.text,
                    text: "Job Title",
                    controller: provider.jobDesignation,
                    validatorErrorMessage: 'Please enter job title'),
                kheight20,
                TextFormWidget(
                    keyboardtype: TextInputType.text,
                    text: "Company Name",
                    controller: provider.companyName,
                    validatorErrorMessage: 'Please enter Company Name'),
                kheight20,
                TextFormWidget(
                    keyboardtype: TextInputType.text,
                    text: "Job Location",
                    controller: provider.companyPlace,
                    validatorErrorMessage: 'Please enter Company Place'),
                kheight20,
                TextFormWidget(
                    keyboardtype: TextInputType.text,
                    text: "State",
                    controller: provider.companystate,
                    validatorErrorMessage: 'Please enter Company Place'),
                kheight20,
                TextFormWidget(
                    keyboardtype: TextInputType.text,
                    text: "country",
                    controller: provider.companyCountry,
                    validatorErrorMessage: 'Please enter Company Place'),
                kheight20,

                TextFormWidget(
                    keyboardtype: TextInputType.text,
                    text: "Job Vacancies",
                    controller: provider.jobVaccancies,
                    validatorErrorMessage: 'Please Enter Job Vacancies'),

                kheight20,
                RadioButton(),
                Consumer<JobPostController>(
                  builder: (context, value, child) {
                    return DropdownButton<String>(
                      elevation: 5,
                      iconEnabledColor: kBlack,
                      hint: Text(
                        value.dropdownValue,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      items: ['Full Time', 'Part Time', 'Remote']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        value.dropdownValue = newValue!;
                        value.notifyListeners();
                      },
                    );
                  },
                ),
                // const SizedBox(
                //   width: 40,
                // ),
                Row(children: [
                  kWidth,
                  Expanded(
                      child: TextFormWidget(
                          keyboardtype: TextInputType.number,
                          validatorErrorMessage: 'Required',
                          text: '₹ Min Salary',
                          controller: provider.minSalary)),
                  kWidth10,
                  const Text(
                    'to',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  kWidth10,
                  Expanded(
                      child: TextFormWidget(
                          keyboardtype: TextInputType.number,
                          validatorErrorMessage: 'Required',
                          text: '₹ Max Salary',
                          controller: provider.maxSalary))
                ]),
                kheight20,
                TextFormWidget(
                    keyboardtype: TextInputType.multiline,
                    text: "Job Description....",
                    textstyle: 20,

                    //maxlength: 200,
                    controller: provider.jobDiscription,
                    maxline: 5,
                    validatorErrorMessage: 'Please enter job title'),
                kheight20,

                ElevatedButton(
                    onPressed: () async {
                      await provider
                          .jobPostButton(context)
                          .whenComplete(() async {
                        Provider.of<BottomNavBarController>(context,
                                listen: false)
                            .currentIndex = 0;
                        await RouteNavigator.pushRemoveUntil(
                            context, const JobScreen());
                        provider.dispos(context);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        minimumSize: const Size(100, 50)),
                    child: const Text('Post')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFormWidget extends StatelessWidget {
  const TextFormWidget(
      {Key? key,
      required this.text,
      required this.controller,
      required this.validatorErrorMessage,
      this.maxline = 1,
      this.keyboardtype = TextInputType.number,
      this.textstyle = 15})
      : super(key: key);
  final String text;
  final TextEditingController controller;
  final String validatorErrorMessage;
  final TextInputType keyboardtype;
  final int maxline;
  final num textstyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxline,
      keyboardType: keyboardtype,
      controller: controller,
      decoration: InputDecoration(
          hintText: text,
          hintStyle: textstyle == 15
              ? const TextStyle(fontSize: 15, fontWeight: FontWeight.w400)
              : const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: mainColor),
              borderRadius: BorderRadius.circular(15)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(width: 4, color: kBlack),
              borderRadius: BorderRadius.circular(15)),
          focusColor: kBlack),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorErrorMessage;
        } else {
          return null;
        }
      },
    );
  }
}
