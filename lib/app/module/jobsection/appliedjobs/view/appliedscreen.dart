import 'package:flutter/material.dart';

import 'package:jobizy/app/module/jobsection/appliedjobs/controller/appliedcontroller.dart';
import 'package:jobizy/app/util/constraisns.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AppliedJobs extends StatelessWidget {
  const AppliedJobs({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ApliedController>(context);
    
    return provider.isLoading
        ? Lottie.asset('assets/images/98096-washer-waiting.json',
            height: 200, width: 200)
        : LimitedBox(
            maxHeight: 200,
            maxWidth: 310,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  
                  return GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      height: 200,
                      width: 310,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 5,
                        color: const Color(0xff008080),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                provider.alljobs[index].designation.toString(),
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              kheight20,
                              Text(
                                provider.alljobs[index].company.toString(),
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              kheight20,
                              Text(
                                provider.alljobs[index].applicationStatus!
                                    .appliedAt!
                                    .toString(),
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                separatorBuilder: (context, index) => const SizedBox(
                      width: 2,
                    ),
                itemCount: provider.alljobs.length),
          );
  }
}
