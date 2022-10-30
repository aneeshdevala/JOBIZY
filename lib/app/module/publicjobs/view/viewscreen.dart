import 'package:flutter/material.dart';

import 'package:jobizy/app/module/jobsscreen/view/job_screen.dart';
import 'package:jobizy/app/module/publicjobs/controller/searchcontroll.dart';
import 'package:jobizy/app/module/publicjobs/view/widgets/data.dart';
import 'package:jobizy/app/module/publicjobs/view/widgets/jobsdetails.dart';
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
      body: SingleChildScrollView(
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
    final provider = Provider.of<SearchController>(context, listen: false);
    final _list = Jobs.generatejobs();
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40.0),
            child: SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: const Icon(
                      Icons.grid_view_sharp,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.grey.shade300,
                      ),
                      onPressed: () {
                        RouteNavigator.pushRoute(context, const JobScreen());
                      },
                      child: const Text('Your Jobs',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Find the worlds most',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Amazing job',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15.0,
              bottom: 15.0,
            ),
            child: Material(
              child: TextField(
                textInputAction: TextInputAction.search,
                controller: provider.searchController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  suffixIcon: Container(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        provider.searchButton(context);
                      },
                      child: const Icon(
                        Icons.search,
                        color: Color(0xff008080),
                        size: 30.0,
                      ),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Search Job',
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 20.0),
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
                  padding: EdgeInsets.only(right: 8.0),
                  child: Text(
                    'See more',
                    style: TextStyle(
                      color: Color(0xff008080),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(bottom: 10.0, right: 5.0, left: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.grey.shade300, // red as border color
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Image.asset(
                        'assets/images/icons8-facebook-500.png',
                        width: 35,
                        height: 35,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.grey.shade300, // red as border color
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Image.asset(
                        'assets/images/3d-fluency-google-logo.png',
                        width: 35,
                        height: 35,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 70,
                  padding: const EdgeInsets.only(right: 4.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.grey.shade300, // red as border color
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Image.asset(
                        'assets/images/3d-fluency-github-logo.png',
                        width: 35,
                        height: 35,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.grey.shade300, // red as border color
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Image.asset(
                        'assets/images/icons8-facebook-500.png',
                        width: 35,
                        height: 35,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
          ListView.separated(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var job = _list[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => JobDetails(
                        jobs: job,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                job.image,
                                width: 30,
                                height: 30,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                job.companyName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              height: 30,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: IconButton(
                                  icon: const Icon(Icons.bookmark),
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
                            job.stack,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            job.shortdescription,
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
                                padding: const EdgeInsets.all(8.0),
                                child: const Icon(
                                  Icons.timer_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 3.0),
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
            separatorBuilder: (context, index) => const Divider(),
            itemCount: _list.length,
          ),
        ],
      ),
    );
  }
}
