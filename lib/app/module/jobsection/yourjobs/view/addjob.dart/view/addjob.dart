import 'package:flutter/material.dart';
import 'package:jobizy/app/module/jobsection/yourjobs/view/addjob.dart/controller/imagecontroller.dart';
import 'package:jobizy/app/module/jobsection/yourjobs/view/job_screen.dart';
import 'package:jobizy/app/module/bottomscreen/controller/bottomnavcon.dart';
import 'package:jobizy/app/module/jobsection/yourjobs/view/addjob.dart/controller/addjobcon.dart';
import 'package:jobizy/app/module/jobsection/yourjobs/view/addjob.dart/view/widgets/radiobutton.dart';
import 'package:jobizy/app/util/colors.dart';
import 'package:jobizy/app/util/constraisns.dart';

import 'package:jobizy/app/util/route.dart';
import 'package:provider/provider.dart';

class AddjobScreen extends StatelessWidget {
  const AddjobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final imagePro = Provider.of<UserImagePovHome>(context, listen: false);
    final provider = Provider.of<JobPostController>(context);
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
                Row(
                  children: [
                    const Text('Company Logo',
                        style: TextStyle(
                            color: kBlack,
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                    kWidth10,
                    GestureDetector(
                      onTap: () {
                        context.read<UserImagePovHome>().pickSource(context);
                      },
                      child: Consumer<UserImagePovHome>(
                          builder: ((context, value, child) => Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                    color: kWhite,
                                    border: Border.all(color: kBlack),
                                    borderRadius: BorderRadius.circular(10)),
                                child: value.imageFile == null
                                    ? const Icon(Icons.add_a_photo)
                                    : Image.file(value.imageFile!),
                              ))),
                    ),
                  ],
                ),
                kheight,
                TextFormWidget(
                    keyboardtype: TextInputType.text,
                    label: "Job Title",
                    controller: provider.jobDesignation,
                    validatorErrorMessage: 'Please enter job title'),
                kheight20,
                TextFormWidget(
                    keyboardtype: TextInputType.text,
                    label: "Company Name",
                    controller: provider.companyName,
                    validatorErrorMessage: 'Please enter Company Name'),
                kheight20,
                TextFormWidget(
                    keyboardtype: TextInputType.text,
                    label: "Job Location",
                    controller: provider.companyPlace,
                    validatorErrorMessage: 'Please enter Company Place'),
                kheight20,
                TextFormWidget(
                    keyboardtype: TextInputType.text,
                    label: "State",
                    controller: provider.companystate,
                    validatorErrorMessage: 'Please enter Company Place'),
                kheight20,
                TextFormWidget(
                    keyboardtype: TextInputType.text,
                    label: "country",
                    controller: provider.companyCountry,
                    validatorErrorMessage: 'Please enter Company Place'),
                kheight20,

                TextFormWidget(
                    keyboardtype: TextInputType.text,
                    label: "Job Vacancies",
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
                          label: '₹ Min Salary',
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
                          label: '₹ Max Salary',
                          controller: provider.maxSalary))
                ]),
                kheight20,
                TextFormWidget(
                    keyboardtype: TextInputType.multiline,
                    label: "Job Description....",
                    textstyle: 20,

                    //maxlength: 200,
                    controller: provider.jobDiscription,
                    maxline: 5,
                    validatorErrorMessage: 'Please enter job title'),
                kheight20,
                // provider.isloading
                //     ? const Center(
                //         child: CircularProgressIndicator(),
                //       )
                //     :
                ElevatedButton(
                    onPressed: () {
                      imagePro.createProfileRequest(context);
                      //  provider.jobPostButton(context);
                      // await provider
                      //     .jobPostButton(context)
                      //     .whenComplete(() async {
                      //   Provider.of<BottomNavBarController>(context,
                      //           listen: false)
                      //       .currentIndex = 0;
                      //provider.dispos(context);
                      //   // imagePro.createProfileRequest(context);
                      // });
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
      required this.label,
      required this.controller,
      required this.validatorErrorMessage,
      this.maxline = 1,
      this.keyboardtype = TextInputType.number,
      this.textstyle = 15})
      : super(key: key);
  final String label;
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
          labelText: label,
          labelStyle: const TextStyle(fontSize: 16, color: kGrey),
          hintStyle: textstyle == 12
              ? const TextStyle(fontSize: 12, fontWeight: FontWeight.w400)
              : const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
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
