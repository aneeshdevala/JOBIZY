import 'package:flutter/material.dart';
import 'package:jobizy/app/module/alljobs/yourjobs/view/addjob.dart/controller/addjobcon.dart';
import 'package:jobizy/app/module/alljobs/yourjobs/view/addjob.dart/view/addjob.dart';
import 'package:jobizy/app/util/colors.dart';
import 'package:jobizy/app/util/constraisns.dart';
import 'package:provider/provider.dart';

class RadioButton extends StatelessWidget {
  RadioButton({
    Key? key,
  }) : super(key: key);

  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<JobPostController>(context);
    return Column(
      children: [
        Row(
          key: globalKey,
          children: [
            Expanded(
              child: RadioListTile(
                selected: true,
                activeColor: mainColor,
                title: const Text('Fresher'),
                value: "Fresher",
                groupValue: provider.groupValue,
                onChanged: (value) {
                  provider.radioButton('Fresher');
                  provider.displayNewTextfield = false;
                  provider.jobType = value.toString();
                },
              ),
            ),
            kWidth10,
            Expanded(
              child: RadioListTile(
                activeColor: mainColor,
                title: const Text('Experenced'),
                value: "Experenced",
                groupValue: provider.groupValue,
                onChanged: (value) {
                  provider.radioButton('Experenced');
                  provider.jobType = value.toString();
                  provider.displayNewTextfield = true;
                },
              ),
            ),
          ],
        ),
        Visibility(
            visible: provider.displayNewTextfield,
            child: Row(
              children: [
                Expanded(
                    child: SizedBox(
                        height: 70,
                        child: TextFormWidget(
                            validatorErrorMessage: 'Required',
                            label: '  Mix Exp  ',
                            controller: provider.minExp))),
                kWidth20,
                const Text(
                  'to',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                kWidth20,
                Expanded(
                    child: SizedBox(
                        height: 70,
                        child: TextFormWidget(
                            validatorErrorMessage: 'Required',
                            label: '  Max Exp  ',
                            controller: provider.maxExp))),
              ],
            ))
      ],
    );
  }
}
