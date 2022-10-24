import 'package:flutter/material.dart';
import 'package:jobizy/app/module/jobsscreen/controller/jobcontroller.dart';
import 'package:jobizy/app/services/jobservice.dart';

import 'package:provider/provider.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final JobController provider = context.read<JobController>();
    final provider = Provider.of<JobController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job'),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
          colors: [Colors.orange[300]!, Colors.orange[100]!],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () async {
                //await provider.getAllJobs(context);
            
                await GetAllJobsService().getAlljobs(context);
                // RouteNavigator.pushReplacement(context, const AddjobScreen());
              },
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
