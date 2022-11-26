import 'package:flutter/material.dart';
import 'package:jobizy/app/module/jobsection/yourjobs/controller/jobcontroller.dart';
import 'package:jobizy/app/module/jobsection/yourjobs/view/addjob.dart/view/addjob.dart';
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
          const SearchCard1(),
          LimitedBox(maxHeight: 40, child: ChoiceChipSearch()),
          kheight20,
          context.watch<JobController>().newWidget(),
            

              //  const JobScreen(),
              //yourJobs(jobprovider, context),
          kheight20,
          ElevatedButton(
              onPressed: () {
                RouteNavigator.pushRoute(context, AddjobScreen());
              },
              child: Text('Post Job'))
        ],
      ),
    );
  }

}
