

  import 'package:flutter/material.dart';
import 'package:jobizy/app/util/constraisns.dart';
import 'package:jobizy/app/util/route.dart';
import 'package:provider/provider.dart';

import '../../jobsection/yourjobs/controller/jobcontroller.dart';
import '../../jobsection/yourjobs/jobfullview.dart';

class Yourjobswidget extends StatelessWidget {
  const Yourjobswidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
           final jobprovider = Provider.of<JobController>(context, listen: false);
    
    return Selector<JobController, bool>(
    builder: ((_, isloading, __) {
          return jobprovider.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : jobprovider.alljobs.isEmpty
                  ? const Text("No jobs")
                  : LimitedBox(
                      maxHeight: 200,
                      maxWidth: 310,
                      child: ListView.separated(
                        //padding: EdgeInsets.zero,
                        //physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          return GestureDetector(
                            onTap: () {
                              RouteNavigator.pushRoute(
                                  context,
                                  JobFullDetails(
                                    jobs: jobprovider.alljobs[index],
                                  ));
                            },
                            child: SizedBox(
                              height: 200,
                              width: 310,
                              child: Card(
                                color: const Color(0xff008080),
                                elevation: 5,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    // crossAxisAlignment:
                                    //     CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,

                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              'assets/images/3d-fluency-google-logo.png',
                                              width: 30,
                                              height: 30,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              jobprovider.alljobs[index].company
                                                  .toString(),
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ),
                                          //const Spacer(),
                                          Container(
                                            height: 30,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: IconButton(
                                                icon:
                                                    const Icon(Icons.bookmark),
                                                color: Colors.grey,
                                                iconSize: 15,
                                                onPressed: () {},
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          jobprovider.alljobs[index].designation
                                              .toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text(
                                            //********************************* */
                                            "Job Description",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                            //***************************************** */
                                          ),
                                          Text(
                                            jobprovider
                                                .alljobs[index].description
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            textAlign: TextAlign.start,
                                            maxLines: 2,
                                          )
                                        ],
                                      ),
                                      kheight,
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.timer_outlined,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            'Posted Date-${jobprovider.alljobs[index].createdAt?.day} : ${jobprovider.alljobs[index].createdAt?.month} : ${jobprovider.alljobs[index].createdAt?.year}',
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 2),
                        itemCount: jobprovider.alljobs.length,
                      ),
                    );
        }),
        selector: ((_, obj) => obj.isLoading));;
  }
}
// Selector<JobController, bool> yourJobs(
//       JobController jobprovider, BuildContext context) {
//     return 
//   }