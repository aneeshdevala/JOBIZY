import 'package:flutter/material.dart';
import 'package:jobizy/app/module/alljobs/yourjobs/controller/jobcontroller.dart';
import 'package:jobizy/app/module/alljobs/yourjobs/jobfullview.dart';
import 'package:jobizy/app/module/userprofile/widgets/choicechip.dart';
import 'package:jobizy/app/module/userprofile/widgets/searchcard.dart';
import 'package:jobizy/app/util/constraisns.dart';
import 'package:jobizy/app/util/route.dart';
import 'package:provider/provider.dart';

class AllJobs extends StatefulWidget {
  const AllJobs({Key? key}) : super(key: key);

  @override
  State<AllJobs> createState() => _AllJobsState();
}

class _AllJobsState extends State<AllJobs> {
  //final _list = Jobs.generatejobs();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ColumnBody(),
      ),
    );
  }
}

class ColumnBody extends StatefulWidget {
  const ColumnBody({super.key});

  @override
  State<ColumnBody> createState() => _ColumnBodyState();
}

class _ColumnBodyState extends State<ColumnBody> {
  @override
  Widget build(BuildContext context) {
    final jobprovider = Provider.of<JobController>(context, listen: false);
    //final provider = Provider.of<SearchController>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   padding: const EdgeInsets.only(top: 40.0),
          //   child: SizedBox(
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       children: [
          //         Container(
          //           padding: const EdgeInsets.all(10.0),
          //           decoration: BoxDecoration(
          //             color: Colors.grey.shade300,
          //             borderRadius: const BorderRadius.all(
          //               Radius.circular(10.0),
          //             ),
          //           ),
          //           child: const Icon(
          //             Icons.grid_view_sharp,
          //             color: Colors.black,
          //             size: 25,
          //           ),
          //         ),
          //         const Spacer(),
          //         Container(
          //           padding: const EdgeInsets.all(10.0),
          //           decoration: BoxDecoration(
          //             color: Colors.grey.shade300,
          //             borderRadius: const BorderRadius.all(
          //               Radius.circular(10.0),
          //             ),
          //           ),
          //           child: ElevatedButton(
          //             style: ElevatedButton.styleFrom(
          //               elevation: 0,
          //               backgroundColor: Colors.grey.shade300,
          //             ),
          //             onPressed: () {
          //               RouteNavigator.pushRoute(context, const JobScreen());
          //             },
          //             child: const Text('Your Jobs',
          //                 style: TextStyle(
          //                     color: Colors.black,
          //                     fontSize: 18,
          //                     fontWeight: FontWeight.bold)),
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
          // Container(
          //   padding: const EdgeInsets.only(top: 15.0),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: const [
          //       Text(
          //         'Find the worlds most',
          //         style: TextStyle(
          //           fontSize: 35,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       Text(
          //         'Amazing job',
          //         style: TextStyle(
          //           fontSize: 35,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          const SearchCard1(),
          //*************************************************** */
          // Padding(
          //   padding: const EdgeInsets.only(
          //     top: 15.0,
          //     bottom: 15.0,
          //   ),
          //   child:
          // Material(
          //     child: TextField(
          //       onChanged: (value) {
          //         provider.searchButton(context);
          //       },
          //       // key: provider.searchKey,
          //       textInputAction: TextInputAction.search,
          //       controller: provider.searchController,
          //       decoration: InputDecoration(
          //         fillColor: Colors.white,
          //         suffixIcon: Container(
          //           padding: const EdgeInsets.only(right: 10.0),
          //           child: GestureDetector(
          //             onTap: () {
          //               provider.searchButton(context);
          //             },
          //             child: const Icon(
          //               Icons.search,
          //               color: Color(0xff008080),
          //               size: 30.0,
          //             ),
          //           ),
          //         ),
          //         focusedBorder: OutlineInputBorder(
          //           borderSide: BorderSide(
          //             color: Colors.grey.shade300,
          //             width: 2.0,
          //           ),
          //           borderRadius: BorderRadius.circular(10.0),
          //         ),
          //         enabledBorder: OutlineInputBorder(
          //           borderSide: BorderSide(
          //             color: Colors.grey.shade300,
          //             width: 2.0,
          //           ),
          //           borderRadius: BorderRadius.circular(10.0),
          //         ),
          //         hintText: 'Search Job',
          //       ),
          //     ),
          //   ),
          // ),
          //*************************************************** */
          // Container(
          //   padding: const EdgeInsets.only(bottom: 20.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: const [
          //       Text(
          //         'Browse By Company',
          //         style: TextStyle(
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       Padding(
          //         padding: EdgeInsets.only(right: 8.0),
          //         child: Text(
          //           'See more',
          //           style: TextStyle(
          //             color: Color(0xff008080),
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // browsbylogowidget(),
          Container(
            padding: const EdgeInsets.only(bottom: 15.0, top: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Browse By Company',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    'See more',
                    style: TextStyle(
                        color: Color(0xff008080), fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const LimitedBox(maxHeight: 40, child: ChoiceChipSearch()),
          kheight20,
          const Text('data'),
          //  const JobScreen(),
          Selector<JobController, bool>(
              builder: ((_, isloading, __) {
                return jobprovider.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : jobprovider.alljobs.isEmpty
                        ? const Text("No jobs")
                        : LimitedBox(
                            maxHeight: 180,
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
                                    height: 160,
                                    child: Card(
                                      color: const Color(0xff008080),
                                      elevation: 5,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15.0),
                                        ),
                                      ),
                                      child: Column(
                                        // crossAxisAlignment:
                                        //     CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              // Container(
                                              //   padding:
                                              //       const EdgeInsets.all(8.0),
                                              //   child: Image.asset(
                                              //     'assets/images/3d-fluency-google-logo.png',
                                              //     width: 30,
                                              //     height: 30,
                                              //   ),
                                              // ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Company : ${jobprovider.alljobs[index].company.toString()}",
                                                  style: const TextStyle(
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              jobprovider
                                                  .alljobs[index].designation
                                                  .toString(),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            //********************************* */
                                            "Job Description : ${jobprovider.alljobs[index].description.toString()}",
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                            maxLines: 4,
                                            //***************************************** */
                                          ),
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
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 2),
                              itemCount: jobprovider.alljobs.length,
                            ),
                          );
              }),
              selector: ((_, obj) => obj.isLoading)),
          // provider.searchController.text.isEmpty
          //     ? Center(
          //         child: Column(
          //         children: [
          //           Image.asset(
          //             'assets/searching.png',
          //             height: 200,
          //             width: 200,
          //           ),
          //           const Text(
          //             'Search for a job',
          //             style: TextStyle(
          //               fontSize: 20,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ],
          //       ))
          //     : provider.isloading
          //         ? const Center(child: CircularProgressIndicator())
          //         : searchCard(provider),
          // const SizedBox(
          //   height: 50,
          // )
        ],
      ),
    );
  }
}
