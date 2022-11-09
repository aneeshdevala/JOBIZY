import 'package:flutter/material.dart';
import 'package:jobizy/app/module/alljobs/yourjobs/view/job_screen.dart';
import 'package:jobizy/app/module/alljobs/controller/searchcontroll.dart';
import 'package:jobizy/app/module/alljobs/view/widgets/searchbylogo.dart';
import 'package:jobizy/app/module/alljobs/view/widgets/searchcard.dart';
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
                onChanged: (value) {
                  provider.searchButton(context);
                },
                // key: provider.searchKey,
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
          provider.searchController.text.isEmpty
              ? Center(
                  child: Column(
                  children: [
                    Image.asset(
                      'assets/searching.png',
                      height: 200,
                      width: 200,
                    ),
                    const Text(
                      'Search for a job',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ))
              : provider.isloading
                  ? const Center(child: CircularProgressIndicator())
                  : searchCard(provider),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
