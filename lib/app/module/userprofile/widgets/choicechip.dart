import 'package:flutter/material.dart';

import 'package:jobizy/app/module/jobsection/yourjobs/controller/jobcontroller.dart';

import 'package:provider/provider.dart';

class ChoiceCard extends StatelessWidget {
  ChoiceCard({Key? key}) : super(key: key);

  final taglist = <String>['Saved Jobs', 'Applied Jobs', 'Your Jobs'];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<JobController>(context);
    return Consumer<JobController>(
        builder: (context, value, child) => ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    context.read<JobController>().listchanges(index);
                    provider;
                  },
                  child: Consumer<JobController>(
                    builder: (context, value, child) => Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: provider.listchange == index
                            ? Theme.of(context).primaryColor.withOpacity(0.2)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: provider.listchange == index
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColor.withOpacity(0.2),
                        ),
                      ),
                      child: Text(
                        taglist[index],
                      ),
                    ),
                  ),
                ),
            separatorBuilder: (_, index) => const SizedBox(
                  width: 15,
                ),
            itemCount: taglist.length));
  }
}
