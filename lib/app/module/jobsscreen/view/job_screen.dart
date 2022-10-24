import 'package:flutter/material.dart';
import 'package:jobizy/app/module/jobsscreen/controller/jobcontroller.dart';
import 'package:jobizy/app/module/jobsscreen/view/addjob.dart/view/addjob.dart';
import 'package:jobizy/app/util/route.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Selector<JobController, bool>(
              builder: ((context, isloading, _) {
                return provider.isLoading
                    ? Center(
                        child: Column(
                          children: const [
                            CircularProgressIndicator(),
                            Text("Loading")
                          ],
                        ),
                      )
                    : provider.alljobs.isEmpty
                        ? const Text("No jobs")
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: provider.alljobs.length,
                            itemBuilder: (context, index) {
                              provider.notifyListeners;
                              return ListTile(
                                leading: Image.asset(
                                    'assets/image-removebg-preview.png'),
                                title: Text(
                                    provider.alljobs[index].designation
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(
                                    'Posted by: ${provider.alljobs[index].company}'),
                                trailing: ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("Apply")),
                              );
                            },
                          );
              }),
              selector: ((context, obj) => obj.isLoading)),
          FloatingActionButton(
            onPressed: () async {
              // await GetAll().getAlljobsFor(context);
              RouteNavigator.pushReplacement(context, const AddjobScreen());
            },
            child: const Icon(Icons.add),
          ),
          // Text(provider.alljobs.first.designation.toString()),
        ],
      ),
    );
  }
}
