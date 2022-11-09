import 'package:flutter/material.dart';
import 'package:jobizy/app/module/alljobs/yourjobs/controller/jobcontroller.dart';
import 'package:jobizy/app/module/alljobs/yourjobs/jobfullview.dart';
import 'package:jobizy/app/module/alljobs/yourjobs/view/addjob.dart/view/addjob.dart';
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
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Posted Jobs',
            style: TextStyle(
              fontSize: 25,
              color: kBlack,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: 
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              kheight40,
              Selector<JobController, bool>(
                  builder: ((context, isloading, _) {
                    return provider.isLoading==true
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : provider.alljobs.isEmpty
                            ? const Text("No jobs")
                            : ListView.separated(
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      RouteNavigator.pushRoute(
                                          context,
                                          JobFullDetails(
                                            jobs: provider.alljobs[index],
                                          ));
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
                                                    "Company : ${provider.alljobs[index].company.toString()}",
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
                                                //********************************* */
                                                "Job Description : ${provider.alljobs[index].description.toString()}",
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                ),
                                                maxLines: 4,
                                                //***************************************** */
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: const Icon(
                                                    Icons.timer_outlined,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 3.0),
                                                  child: Text(
                                                    'Posted Date-${provider.alljobs[index].createdAt!.day} : ${provider.alljobs[index].createdAt!.month} : ${provider.alljobs[index].createdAt!.year}',
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
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
        floatingActionButton: FloatingActionButton(
          backgroundColor: mainColor,
          onPressed: () async {
            // await GetAll().getAlljobsFor(context);
            RouteNavigator.pushRoute(context, const AddjobScreen());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
