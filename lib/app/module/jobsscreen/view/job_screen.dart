import 'package:flutter/material.dart';
import 'package:jobizy/app/module/jobsscreen/controller/jobcontroller.dart';
import 'package:jobizy/app/module/jobsscreen/view/addjob.dart/view/addjob.dart';
import 'package:jobizy/app/module/publicjobs/view/widgets/jobsdetails.dart';
import 'package:jobizy/app/util/colors.dart';
import 'package:jobizy/app/util/constraisns.dart';
import 'package:jobizy/app/util/route.dart';

import 'package:provider/provider.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final JobController provider = context.read<JobController>();
    final provider = Provider.of<JobController>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Posted Jobs',
            style: TextStyle(
              fontSize: 30,
              color: kBlack,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              kheight40,
              Selector<JobController, bool>(
                  builder: ((context, isloading, _) {
                    return provider.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : provider.alljobs.isEmpty
                            ? const Text("No jobs")
                            :
                            //  ListView.builder(
                            //     physics: const NeverScrollableScrollPhysics(),
                            //     shrinkWrap: true,
                            //     itemCount: provider.alljobs.length,
                            //     itemBuilder: (context, index) {
                            //       provider.notifyListeners;
                            //       return ListTile(
                            //         leading: Image.asset(
                            //             'assets/image-removebg-preview.png'),
                            //         title: Text(
                            //             provider.alljobs[index].designation
                            //                 .toString(),
                            //             style: const TextStyle(
                            //                 color: Colors.black,
                            //                 fontWeight: FontWeight.bold)),
                            //         subtitle: Text(
                            //             'Posted by: ${provider.alljobs[index].company}'),
                            //         trailing: ElevatedButton(
                            //             onPressed: () {},
                            //             child: const Text("Apply")),
                            //       );
                            //     },
                            //   );
                            ListView.separated(
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => JobDetails(
                                            jobs:,
                                          ),
                                        ),
                                        );
                                    },
                                    child: Card(
                                      color: const Color(0xff008080),
                                      elevation: 5,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15.0),
                                        ),
                                      ),
                                      child: Container(
                                        margin: const EdgeInsets.all(15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Image.asset(
                                                    'assets/images/3d-fluency-google-logo.png',
                                                    width: 30,
                                                    height: 30,
                                                  ),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5.0),
                                                  child: Text(
                                                    "Company Name : ${provider.alljobs[index].company.toString()}",
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                                const Spacer(),
                                                Container(
                                                  height: 30,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Colors.white,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Center(
                                                    child: IconButton(
                                                      icon: const Icon(
                                                          Icons.bookmark),
                                                      color: Colors.grey,
                                                      iconSize: 15,
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                provider
                                                    .alljobs[index].designation
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Job Description : ${provider.alljobs[index].description.toString()}",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                                maxLines: 4,
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: const Icon(
                                                      Icons.timer_outlined,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 3.0),
                                                    child: const Text(
                                                      'Be in the first 20 applicants',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                                itemCount: provider.alljobs.length,
                              );
                  }),
                  selector: ((context, obj) => obj.isLoading)),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: FloatingActionButton(
            onPressed: () async {
              // await GetAll().getAlljobsFor(context);
              RouteNavigator.pushRoute(context, const AddjobScreen());
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
